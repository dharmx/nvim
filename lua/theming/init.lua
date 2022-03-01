local I = {}
local cmd = vim.api.nvim_command

function I.setup(options)
  if vim.fn.exists "syntax_on" then
    cmd "syntax reset"
  end
  _ = require("theming.utils.helpers").apply(options)
end

return I
