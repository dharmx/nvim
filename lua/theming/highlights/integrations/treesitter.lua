local colors = require("utils.theming").get_active_theme()

return {
  ["TreesitterContext"] = {
    bg = colors.shades.shade04,
  },
  ["TSMethod"] = {
    link = "Method",
  },
  ["TSVariable"] = {
    link = "Identifier",
  },
  ["TSField"] = {
    fg = colors.syntax.color20,
  },
  ["TSVariableBuiltin"] = {
    fg = colors.syntax.color08,
    bold = true,
  },
}

-- vim:ft=lua
