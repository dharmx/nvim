local I = {}
local cmd = vim.api.nvim_command

function I.setup(options)
  cmd "highlight clear"
  if vim.fn.exists "syntax_on" then
    cmd "syntax reset"
  end
  vim.g.current_scheme = options.scheme
  local apply = require("highlights.utils.helpers").apply(options)
end

return I
