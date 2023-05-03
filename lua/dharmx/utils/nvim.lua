local A = vim.api

local M = {}
M.abbreviation = {}

function M.abbreviation.create(word, abbrev, options)
  local args = {}
  options = vim.F.if_nil(options, {})

  local command = "abbrev"
  if options.overwrite then command = "nore" .. command end
  if options.mode then command = options.mode .. command end
  if options.buffer then table.insert(args, "<buffer>") end
  if options.silent then table.insert(args, "<silent>") end
  if options.expression then table.insert(args, "<expr>") end

  table.insert(args, word)
  table.insert(args, abbrev)
  if options.dry then return table.concat(vim.tbl_flatten({ command, args }), " ") end
  vim.cmd[command](args)
end

function M.abbreviation.delete(abbrev, options)
  local args = {}
  options = vim.F.if_nil(options, {})
  local command = "unabbrev"

  if options.mode then command = options.mode .. command end
  if options.silent then table.insert(args, "<silent>") end
  if options.buffer then table.insert(args, "<buffer>") end

  table.insert(args, abbrev)
  if options.dry then return table.concat(vim.tbl_flatten({ command, args }), " ") end
  vim.cmd[command](args)
end

function M.abbreviation.clear(options)
  local args = {}
  options = vim.F.if_nil(options, {})
  local command = "abclear"

  if options.mode then command = options.mode .. command end
  if options.silent then table.insert(args, "<silent>") end
  if options.buffer then table.insert(args, "<buffer>") end

  if options.dry then return table.concat(vim.tbl_flatten({ command, args }), " ") end
  vim.cmd[command](args)
end

function M.cmd(alias, command, options)
  if type(options) == "string" then options = { desc = options } end
  options = vim.F.if_nil(options, {})
  A.nvim_create_user_command(alias, command, options)
end

function M.on(events, command, options)
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

function M.group(name, autocmds, clear)
  if type(autocmds) == "boolean" then return A.nvim_create_augroup(name, { clear = autocmds }) end
  local group = A.nvim_create_augroup(name, { clear = clear == false and false or true })
  for _, autocmd in ipairs(autocmds) do
    autocmd.options = vim.F.if_nil(autocmd.options, {})
    autocmd.options.group = group
    M.on(autocmd.events, autocmd.command, autocmd.options)
  end
  return group
end

function M.exclude(items, path, on_entry)
  for entry, entry_type in vim.fs.dir(path) do
    if not vim.tbl_contains(items, entry) then on_entry(entry, entry_type, items, path) end
  end
end

function M.input(options, actions)
  local Input = require("nui.input")
  local autocmd = require("nui.utils.autocmd")
  local event = autocmd.event

  options = vim.F.if_nil(options, {})
  actions = vim.F.if_nil(actions, {})

  local popup_options = {
    position = vim.F.if_nil(options.position, { row = 5, col = 5 }),
    highlight = vim.F.if_nil(options.highlight, "TabLine:FloatBorder"),
    size = vim.F.if_nil(options.size, 50),
    border = vim.F.if_nil(options.border, { style = "solid" }),
  }

  local input = Input(popup_options, {
    prompt = vim.F.if_nil(actions.prompt, " > "),
    default_value = vim.F.if_nil(actions.default_value, "Enter a value!"),
    on_submit = actions.on_submit,
    on_close = actions.on_close,
    on_change = actions.on_change,
  })
  input:mount()

  local keyword = vim.opt.iskeyword - "_" - "-"
  vim.bo.iskeyword = table.concat(keyword:get(), ",")
  vim.schedule(function() A.nvim_command("stopinsert") end)

  input:map("n", "<esc>", input.input_props.on_close, { noremap = true })
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

-- NOTE: Stolen from https://github.com/asrul10/readable-number.nvim.
function M.readable_numbers()
  local current = vim.fn.expand("<cword>")
  if tonumber(current) then
    if #current < 3 then return end
    local formatted = ""
    for index = #current, 1, -3 do
      if index - 3 <= 0 then
        formatted = current:sub(1, index) .. formatted
        break
      end
      formatted = "_" .. current:sub(index - 2, index) .. formatted
    end
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.api.nvim_set_current_line(vim.fn.substitute(vim.fn.getline("."), current, formatted, ""))
  end
end

return M
