local colors = require("utils.theming").get_active_theme()

return {
  ["IndentBlanklineChar"] = {
    fg = colors.shades.shade02,
  },
  ["IndentBlanklineContextChar"] = {
    fg = colors.common.base10,
  },
  ["IndentBlanklineContextStart"] = {
    fg = colors.common.base10,
  },
  ["IndentBlanklineSpaceChar"] = {
    fg = colors.shades.shade02,
  },
  ["IndentBlanklineSpaceCharBlankline"] = {
    fg = colors.shades.shade02,
  },
}

-- vim:ft=lua
