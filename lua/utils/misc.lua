local M = {}
local cmd = vim.api.nvim_command

function M.alias(from, to)
  cmd("command! " .. from .. " " .. to)
end

function M.toggle_status()
  local opt = vim.opt
  local hidden = opt.laststatus._value == 2 and true or false
  if hidden then
    opt.laststatus = 0
    return
  end
  opt.laststatus = 2
end

function M.toggle_number()
  local opt = vim.opt
  if opt.number._value then
    opt.number = false
    return
  end
  opt.number = true
end

return M
