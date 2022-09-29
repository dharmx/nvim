local colors = require("utils.theming").get_active_theme()

return {
  ["SymbolsOutlineConnector"] = {
    fg = colors.shades.shade02,
  },
  ["FocusedSymbol"] = {
    bg = colors.common.base13,
    fg = colors.common.base01,
  },
}

-- vim:ft=lua
