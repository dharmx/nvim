local M = {}

local U = vim.loop
local V = vim.fn
local A = vim.api

local wrap = vim.schedule_wrap
local cmd = A.nvim_create_user_command

local function _create_ranges(file, starting, ending)
  local tokens = {}
  table.insert(tokens, file)
  if starting and ending then
    table.insert(tokens, string.format(":%s-%s", starting, ending))
  elseif starting and not ending then
    table.insert(tokens, string.format(":%s", starting))
  elseif not starting and ending then
    table.insert(tokens, string.format(":%s", ending))
  end
  return table.concat(tokens)
end

local function _print_errors(errors)
  local store = {}
  table.insert(store, "# An ERROR occured.\n")
  for _, line in ipairs(errors) do
    table.insert(store, "- " .. line)
  end

  A.nvim_notify(table.concat(store, "\n"), vim.log.levels.ERROR, {
    icon = " ",
    title = "permalink.lua",
  })
end

function M.fetch_permalink(file, starting, ending, options)
  local Task = require("plenary.job")
  options = vim.F.if_nil(options, {})
  options.open_brower = vim.F.if_nil(options.open_brower, false)
  options.browser = vim.F.if_nil(options.browser, vim.env.BROWSER)

  if options.open_brower then assert(options.browser) end
  if not U.fs_realpath(file) then
    _print_errors({ file .. " does not exist!" })
    return
  end

  Task:new({
    "gh",
    "browse",
    "--no-browser",
    _create_ranges(file, starting, ending),
    on_start = wrap(function()
      A.nvim_notify("Fetching permalink. Please wait... ", vim.log.levels.INFO, {
        icon = " ",
        title = "permalink.lua",
      })
    end),
    on_exit = wrap(function(self, code, _)
      local result = self:result()
      if code ~= 0 then
        _print_errors(result)
        return
      end

      V.setreg("+", result[1])
      A.nvim_notify("Copied fetched link into the +register.", vim.log.levels.INFO, {
        icon = " ",
        title = "permalink.lua",
      })
      if options.open_browser then
        Task:new({
          options.browser,
          result[1],
          detached = true,
          on_start = wrap(function()
            A.nvim_notify("Opened fetched link in " .. options.browser .. ".", vim.log.levels.INFO, {
              icon = " ",
              title = "permalink.lua",
            })
          end)
        }):start()
      end
    end)
  }):start()
end

function M.commands()
  cmd("GHBrowse", function(args)
    local starting
    local ending
    local file = vim.F.if_nil(args.fargs[1], vim.fn.expand("%"))
    if args.range ~= 0 then
      starting = args.line1
      ending = args.line2
    end
    M.fetch_permalink(file, starting, ending, {
      open_browser = true,
    })
  end, {
    range = true,
    desc = "Browse GH.",
    complete = "file",
    nargs = "?",
  })
end

return M
