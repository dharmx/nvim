local I = {}
local cmd = vim.api.nvim_command

function I.setup(options)
  cmd "highlight clear"
  if vim.fn.exists "syntax_on" then
    cmd "syntax reset"
  end
  local apply = require("theming.utils.helpers").apply(options)
end

return I
