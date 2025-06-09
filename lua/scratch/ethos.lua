---@diagnostic disable: cast-local-type, param-type-mismatch, assign-type-mismatch, need-check-nil, undefined-field

-- TODO:
-- + Add UI, HL and mapping options.
-- + Cleanup buffers.
-- + Use namespaces and add_highlights.
-- + Calculate floating window width.
-- + Add a telescope extension.
-- + Variable name suggestor.
-- + Write docs.

local M = {}

local _PROXY = {}

local J = require("plenary.job")
local F = vim.fn
local A = vim.api

-- NOTE:
-- DICTD allows multiple results from different databases but currently
-- I have no idea on how to support that. How do I parse those multiple matches?

-- Internals {{{
---The active database.
---@type string
M._database = nil
---List of minimal floating buffers. This is used for storing the IDs of
---opened minimal word-definition buffers.
---@type number[]
M._buffers = {}
---List of minimal floating windows. This is used for storing the IDs of
---opened minimal word-definition windows.
---@type integer[]
M._windows = {}

---@class EthosConfig
---@field database string Try using `dict -D` for all available values.

---The table of all supported settings for ethos.lua. This should be
---treated as the fallback or, the default config.
---@type EthosConfig
M._defaults = { database = "wn" }
---The current config. Values are extended with `M._defaults` and any
---invalid value will result in an error.
---@type EthosConfig
M._config = M._defaults
---Searching algorithms. Consult the manpage for more.
---@see https://www.mankier.com/8/dictd#Search_Algorithms
---@enum DictStrats
M._strategy = {
  "exact",
  "prefix",
  "nprefix",
  "substring",
  "suffix",
  "re",
  "regexp",
  "soundex",
  "lev",
  "word",
  "first",
  "last",
}
-- }}}

-- Validators {{{
---Validating functions that can be used for checking the validity of a configuration option value.
---@type function[]
local validators = {}

---@param value? {timeout?: number, wait_interval?: number}
---@return boolean
---@see Job.sync
function validators.sync(value)
  if value == nil then return true end
  if type(value) == "boolean" then return true end
  if type(value.timeout) == "number" and type(value.wait_interval) == "nil" then return true end
  if type(value.timeout) == "nil" and type(value.wait_interval) == "number" then return true end
  if type(value.timeout) == "number" and type(value.wait_interval) == "number" then return true end
  return false
end

---@param value? string
---@return boolean
function validators.word(value)
  if value == nil then return false end
  return not not value:match("^[a-zA-Z]+$") -- only qualify string with alpha values as word
end

---@param value? string
---@return boolean
function validators.database(value)
  if value == nil then return false end
  return vim.tbl_contains(M._database, value)
end

---@param value DictStrats
---@return boolean
function validators.strategy(value)
  if value == nil then return true end
  return vim.tbl_contains(M._strategy, value)
end
-- }}}

---@class DictConfig
---@field database string
---@field word string
---@field formatted boolean
---@field strategy DictStrats
---@field on_stdout fun(error: string, data: string, self?: Job)
---@field on_stderr fun(error: string, data: string, self?: Job)
---@field on_exit fun(self?: Job, code: number, signal: number)
---@field sync {timeout?: number, wait_interval?: number}|boolean

---@async
---Get word definition.
---@param word string The word that needs to be queried from the dictd database(s).
---@param options? DictConfig Dictionary related configurations.
---@return table|Job|nil
function M.get(word, options)
  options = vim.F.if_nil(options, {})
  -- This is just option validation. You may skip this.
  vim.validate({
    -- database = { options.database, validators.database, "Valid options are: " .. table.concat(M._database, "|") },
    strategy = { options.strategy, validators.strategy, "Valid options are: " .. table.concat(M._strategy, "|") },
    formatted = { options.formatted, "boolean", true },
    on_stdout = { options.on_stdout, "function", true },
    on_exit = { options.on_exit, "function", true },
    on_stderr = { options.on_stderr, "function", true },
    sync = { options.sync, validators.sync, "Either provide a boolean value / {timeout=number,wait_interval=number}" },
    word = { word, validators.word, "Only alphabets are allowed!" },
  })

  word = word:lower()
  local args = {}
  if options.database then
    table.insert(args, "--database")
    table.insert(args, options.database)
  end
  if options.strategy then
    table.insert(args, "--strategy")
    table.insert(args, options.strategy)
  end

  if options.formatted then table.insert(args, "--formatted") end
  if options.nocorrect then table.insert(args, "--nocorrect") end
  table.insert(args, word)

  -- maybe allow a way to configure this? I have not thought that far ahead
  local task = J:new({
    command = "dict",
    enabled_recording = true,
    skip_validation = true,
    args = args,
    on_exit = options.on_exit,
    on_stderr = options.on_stderr,
    on_stdout = options.on_stdout,
  })

  if options.sync then -- this is blocking
    if type(options.sync) == "table" then return { task:sync(options.timeout, options.wait_interval) } end
    return { task:sync() }
  end
  if options.on_exit or options.on_stderr or options.on_stdout then -- this is async
    task:start()
    return
  end
  return task
end

---@class DictSpec
---@field count number
---@field source string
---@field word string
---@field content string[]

---The output format of `dict -d wn ethos` is like the following.
---```bash
---1 definition found
---From WordNet (r) 3.1 (2011) [wn]:
---
---ethos
---   n 1: (anthropology) the distinctive spirit of a culture or an
---        era; "the Greek ethos"
---```
---Note that, the main problem with this is that it wraps manually.
---This hinders parsing.
---@param raw_value string[]
---@return DictSpec
function M.parse(raw_value)
  -- WARN: Needs more guards.
  local parsed = {}
  parsed.count = tonumber(table.remove(raw_value, 1):sub(1, 1))
  parsed.source = vim.split(table.remove(raw_value, 2), " ", { plain = true })[2]
  parsed.word = vim.trim(table.remove(raw_value, 3))

  parsed.content = {} -- root of all headaches
  for _, item in ipairs(raw_value) do
    local trimmed = vim.trim(item)
    if trimmed ~= "" then table.insert(parsed.content, item) end
  end
  return parsed
end

---Open a minimal floating window and populate it with the word definition(s).
---@param word? string The word which needs to searched for in the dictd database(s).
---@param options? DictConfig Optional customization options.
function M.open(word, options)
  word = vim.F.if_nil(word, F.expand("<cword>")) -- get word under the cursor
  if not validators.word(word) then return end
  options = vim.F.if_nil(options, {})
  options.database = M._config.database -- maybe allow to change on the fly?

  -- this will be passed onto plenary.job.
  options.on_exit = vim.schedule_wrap(function(self, code, _)
    if code == 0 then
      local parsed = M.parse(self:result())
      -- TODO: Format and display. Do I need to write a parser? Is there really no other way?
      local replacement = parsed.content

      -- allow customizing these.
      local buffer = A.nvim_create_buf(false, true)
      local window = A.nvim_open_win(buffer, false, {
        border = "solid",
        external = false,
        focusable = true,
        height = #replacement,
        relative = "cursor",
        width = 80,
        row = 3,
        col = 3,
        style = "minimal",
      })

      A.nvim_buf_set_lines(buffer, 0, -1, false, replacement)
      vim.keymap.set("n", "q", function() A.nvim_win_close(window, true) end, {
        buffer = buffer,
        desc = "Close dictd window.",
      })

      -- record float buffer and window history.
      table.insert(M._buffers, buffer)
      table.insert(M._windows, window)
    end
  end)
  -- basically get the word definition and run a callback on exit.
  M.get(word, options)
end

---I did not need to write this. But anyway.
---Utility function for closing all floating word-definition windows.
function M.close()
  for _, window in ipairs(M._windows) do
    A.nvim_win_close(window, true)
  end
  M._windows = {}
end

---Initialize the plugin and customize its behaviour.
---@param options EthosConfig? Optional customization options.
function M.setup(options)
  options = vim.F.if_nil(options, {})
  ---@see vim.tbl_deep_extend
  M._config = vim.tbl_deep_extend("keep", options, M._defaults)

  -- WARN: High risk of UI blockage. Maybe use Job.sync with a timeout?
  -- BUG: Fix delay in dict utility calls first.
  --
  -- local db = F.system({ "dict", "--dbs" })
  -- db = vim.split(db, "\n", { plain = true })
  -- table.remove(db, 1)
  -- table.remove(db, #db)
  --
  -- for index, item in ipairs(db) do
  --   db[index] = vim.split(vim.trim(item), " ", { plain = true })[1]
  --   if db[index] == "" then table.remove(db, index) end
  -- end
  -- if #db > 0 then
  --   M._database = db
  -- else
  --   error("No databases found. See https://github.com/cheusov/dictd.")
  -- end
  -- NOTE: delete the following line after dictd issue is resolved
  M._database = "wn"

  -- TODO: Allow customizations.
  vim.keymap.set("n", ";f", function()
    if #M._windows > 0 then
      M.close()
      return
    end
    M.open()
  end)
  M._loaded = true -- you are only allowed to call setup once.
end

---A shorthand for `vim.api.nvim_notify(message, vim.log.levels.WARN, {...})`.
---@param message string
function M.warn(message) A.nvim_notify(message, vim.log.levels.WARN, { title = "ethos.lua", icon = " " }) end

-- NOTE: Forbid calling non-existent members and setup twice.
setmetatable(_PROXY, {
  __index = function(_, item)
    if not M._loaded then
      if item == "setup" then return M.setup end
      M.warn("You need to run setup() first!")
      return function() return false end
    end
    if vim.tbl_contains(vim.tbl_keys(M), item) then return M[item] end
    M.warn(item .. " item does not exist!")
    return function() return false end -- should I just call error() instead?
  end,
})

return _PROXY
