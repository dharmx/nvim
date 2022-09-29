lua << EOF
require("theming").setup { theme = "ashes" }
require("utils.stline").set_stl_float(require("stline.config").MAIN.floating)

local theming = require("utils.theming")
local hi = theming.highlight
local colors = theming.get_active_theme()

if not require("stline.config").MAIN.floating then
  hi("StatusLineScopes", { fg = colors.common.base13, bg = colors.shades.shade06 })
else
  hi("StatusLineScopes", { fg = colors.common.base13, bg = colors.common.base00 })
end
EOF

" vim:ft=vim
