---@diagnostic disable: cast-local-type, param-type-mismatch, assign-type-mismatch

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

local Task = require("plenary.job")
local F = vim.fn
local A = vim.api

M._database = nil
M._validate = {}
M._buffers = {}
M._windows = {}
M._defaults = { database = "wn" }
M._config = M._defaults
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

function M._validate.sync(value)
  if value == nil then return true end
  if type(value) == "boolean" then return true end
  if type(value.timeout) == "number" and type(value.wait_interval) == "nil" then return true end
  if type(value.timeout) == "nil" and type(value.wait_interval) == "number" then return true end
  if type(value.timeout) == "number" and type(value.wait_interval) == "number" then return true end
  return false
end

function M._validate.word(value)
  if value == nil then return false end
  return not not value:match("^[a-zA-Z]+$")
end

function M._validate.database(value)
  if value == nil then return false end
  return vim.tbl_contains(M._database, value)
end

function M._validate.strategy(value)
  if value == nil then return true end
  return vim.tbl_contains(M._strategy, value)
end

function M.get(word, options)
  options = vim.F.if_nil(options, {})
  vim.validate({
    database = { options.database, M._validate.database, "Valid options are: " .. table.concat(M._database, "|") },
    strategy = { options.strategy, M._validate.strategy, "Valid options are: " .. table.concat(M._strategy, "|") },
    formatted = { options.formatted, "boolean", true },
    on_stdout = { options.on_stdout, "function", true },
    on_exit = { options.on_exit, "function", true },
    on_stderr = { options.on_stderr, "function", true },
    sync = { options.sync, M._validate.sync, "Either provide a boolean value / {timeout=number,wait_interval=number}" },
    word = { word, M._validate.word, "Only alphabets are allowed!" },
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

  local task = Task:new({
    command = "dict",
    enabled_recording = false,
    skip_validation = true,
    args = args,
    on_exit = options.on_exit,
    on_stderr = options.on_stderr,
    on_stdout = options.on_stdout,
  })
  if options.sync then
    if type(options.sync) == "table" then return task:sync(options.timeout, options.wait_interval) end
    return task:sync()
  end
  if options.on_exit or options.on_stderr or options.on_stdout then
    task:start()
    return
  end
  return task
end

function M.parse(raw_value)
  -- WARN: Needs more guards.
  local parsed = {}
  parsed.count = tonumber(table.remove(raw_value, 1):sub(1, 1))
  parsed.source = vim.split(table.remove(raw_value, 2), " ", { plain = true })[2]
  parsed.word = vim.trim(table.remove(raw_value, 3))
  parsed.content = {}
  for _, item in ipairs(raw_value) do
    local trimmed = vim.trim(item)
    if trimmed ~= "" then table.insert(parsed.content, item) end
  end
  return parsed
end

function M.open(word, options)
  word = vim.F.if_nil(word, F.expand("<cword>"))
  if not M._validate.word(word) then return end
  options = vim.F.if_nil(options, {})
  options.database = M._config.database

  options.on_exit = vim.schedule_wrap(function(self, code, _)
    if code == 0 then
      local parsed = M.parse(self:result())
      -- TODO: Format and display.
      local replacement = parsed.content

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
      vim.keymap.set(
        "n",
        "q",
        function() A.nvim_win_close(window, true) end,
        { buffer = buffer, desc = "Close dictd window." }
      )

      table.insert(M._buffers, buffer)
      table.insert(M._windows, window)
    end
  end)
  M.get(word, options)
end

function M.close()
  for _, window in ipairs(M._windows) do
    A.nvim_win_close(window, true)
  end
  M._windows = {}
end

function M.setup(options)
  options = vim.F.if_nil(options, {})
  M._config = vim.tbl_deep_extend("keep", options, M._defaults)

  local db = F.system({ "dict", "--dbs" })
  db = vim.split(db, "\n", { plain = true })
  table.remove(db, 1)
  table.remove(db, #db)
  for index, item in ipairs(db) do
    db[index] = vim.split(vim.trim(item), " ", { plain = true })[1]
    if db[index] == "" then table.remove(db, index) end
  end
  if #db > 0 then
    M._database = db
  else
    error("No databases found. See https://github.com/cheusov/dictd.")
  end

  vim.keymap.set("n", ";f", function()
    if #M._windows > 0 then
      M.close()
      return
    end
    M.open()
  end)
  M._loaded = true
end

function M.warn(message) A.nvim_notify(message, vim.log.levels.WARN, { title = "ethos.lua", icon = " " }) end

setmetatable(_PROXY, {
  __index = function(_, item)
    if not M._loaded then
      if item == "setup" then return M.setup end
      M.warn("You need to run setup() first!")
      return function() return false end
    end
    if vim.tbl_contains(vim.tbl_keys(M), item) then return M[item] end
    M.warn(item .. " item does not exist!")
    return function() return false end
  end,
})

return _PROXY
