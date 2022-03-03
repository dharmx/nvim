local I = {}
local cmd = vim.api.nvim_command

function I.setup(options)
  _G.colorscheme = options.scheme
  if vim.fn.exists "syntax_on" then
    cmd "syntax reset"
  end
  _ = require("theming.utils.helpers").apply(options)
end

return I
