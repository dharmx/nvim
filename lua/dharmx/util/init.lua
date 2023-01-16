local M = {}

local F = vim.fn
local A = vim.api
local cmd = A.nvim_command

function M.abbrev(buffer, command, expression)
  local formatted = string.format("cnoreabbrev %s %s %s", expression and "<expr>" or "", buffer, command)
  cmd(formatted)
end

function M.alias(alias, command, options)
  if type(options) == "string" then options = { desc = options } end
  options = vim.F.if_nil(options, {})
  A.nvim_create_user_command(alias, command, options)
end

function M.unalias(command) A.nvim_del_user_command(command) end

function M.balias(buffer, alias, command, options)
  options = options or {}
  A.nvim_buf_create_user_command(buffer, alias, command, options)
end

function M.autocmd(events, command, options)
  options = vim.F.if_nil(options, {})
  if type(options) == "string" then options = { desc = options } end
  local autocmd_options = {}
  autocmd_options[type(command) == "string" and "command" or "callback"] = command
  if not options.buffer then
    autocmd_options.pattern = options.patterns
  else
    autocmd_options.buffer = options.buffer or options.bufnr
  end
  if options.group then autocmd_options.group = options.group end
  return options.group, A.nvim_create_autocmd(events, autocmd_options)
end

function M.augroup(name, autocmds, clear)
  if type(autocmds) == "boolean" then return A.nvim_create_augroup(name, { clear = autocmds }) end
  local group = A.nvim_create_augroup(name, { clear = clear == false and false or true })
  for _, autocmd in ipairs(autocmds) do
    autocmd.options = vim.F.if_nil(autocmd.options, {})
    autocmd.options.group = group
    M.autocmd(autocmd.events, autocmd.command, autocmd.options)
  end
  return group
end

function M.input(options, actions)
  local Input = require("nui.input")
  local autocmd = require("nui.utils.autocmd")
  local event = autocmd.event

  options = options or {}
  actions = actions or {}

  local popup_options = {
    position = options.position or {
      row = 5,
      col = 5,
    },
    highlight = options.highlight or "TabLine:FloatBorder",
    size = options.size or 50,
    border = options.border or {
      style = "solid",
    },
  }

  local input = Input(popup_options, {
    prompt = actions.prompt or " > ",
    default_value = actions.default_value or "Enter a value!",
    on_submit = actions.on_submit,
    on_close = actions.on_close,
    on_change = actions.on_change,
  })
  input:mount()

  local keyword = vim.opt.iskeyword - "_" - "-"
  vim.bo.iskeyword = table.concat(keyword:get(), ",")
  vim.schedule(function() vim.api.nvim_command("stopinsert") end)

  -- TODO: Return the input object so that mappings can be defined separately.
  input:map("n", "<esc>", input.input_props.on_close, { noremap = true })
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

function M.shorten()
  local format = [[!curl --silent "https://is.gd/create.php?format=simple&url=%s"]]

  M.input({
    position = {
      row = 5,
      col = 5,
    },
    size = 50,
    border = {
      style = "solid",
    },
  }, {
    prompt = "   ",
    default_value = "Your URL...",
    on_submit = function(value)
      local raw = vim.split(A.nvim_exec(string.format(format, value), true), "\n", { plain = true })
      if value == "Your URL..." then
        M.notify({
          message = "ERROR: Couldn't fetch the shortened URL!",
          icon = " ",
          title = "URL Shortner",
          level = vim.log.levels.ERROR,
        })
      else
        F.setreg(vim.v.register, raw[#raw])
        M.notify({
          message = "Saved link to system clipboard!",
          icon = " ",
          title = "URL Shortner",
        })
      end
    end,
  })
end

return M

-- vim:filetype=lua
