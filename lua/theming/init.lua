local I = {}

function I.setup(options)
  _G.colorscheme = options.scheme
  if fn.exists "syntax_on" then
    cmd "syntax reset"
  end
  _ = require("theming.utils.helpers").apply(options)
end

return I

-- vim:ft=lua
