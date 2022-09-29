local colors = require("utils.theming").get_active_theme()

return {
  ["htmlLink"] = {
    fg = colors.syntax.color15,
    underline = true,
  },
  ["htmlH1"] = {
    fg = colors.syntax.color09,
    bold = true,
  },
  ["htmlH2"] = {
    fg = colors.syntax.color17,
    bold = true,
  },
  ["htmlH3"] = {
    fg = colors.syntax.color13,
    bold = true,
  },
  ["htmlH4"] = {
    fg = colors.syntax.color06,
    bold = true,
  },
  ["htmlH5"] = {
    fg = colors.syntax.color00,
    bold = true,
  },
}

-- vim:ft=lua
