local colors = require("utils.theming").get_active_theme()

return {
  ["markdownH1"] = {
    fg = colors.syntax.color00,
    bold = true,
  },
  ["markdownH2"] = {
    fg = colors.syntax.color02,
    bold = true,
  },
  ["markdownH3"] = {
    fg = colors.syntax.color03,
    bold = true,
  },
  ["markdownH1Delimiter"] = {
    fg = colors.syntax.color16,
  },
  ["markdownH2Delimiter"] = {
    fg = colors.syntax.color17,
  },
  ["markdownH3Delimiter"] = {
    fg = colors.syntax.color15,
  },
}

-- vim:ft=lua
