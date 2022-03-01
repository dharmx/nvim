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

function M.toggle_tabline_on_dashboard()
  local hi = require("theming.utils.helpers").highlight
  if vim.api.nvim_buf_get_option(0, "ft") == "dashboard" then
    local colors = require("theming.utils.helpers").get_active_scheme()
    hi("TabLine", {
      foreground = colors.common.base00,
      background = colors.common.base00,
    })
    hi("TabLineFill", {
      foreground = colors.common.base00,
      background = colors.common.base00,
    })
    cmd "set tabline=`"
    return
  end
  return cmd "set tabline=%!v:lua.nvim_bufferline()"
end

return M
