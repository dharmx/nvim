local colors = require("utils.theming").get_active_theme()

return {
  ["luaBuiltIn"] = {
    link = "Keyword",
  },
  ["luaDocTag"] = {
    fg = colors.syntax.color15,
    bold = true,
  },
  ["luaFuncTable"] = {
    fg = colors.syntax.color06,
    bold = true,
  },
  ["luaIn"] = {
    link = "Keyword",
  },
  ["luaCond"] = {
    link = "Conditional",
  },
  ["luaParen"] = {
    link = "Delimiter",
  },
  ["luaParens"] = {
    link = "Delimiter",
  },
  ["luaBraces"] = {
    link = "Delimiter",
  },
  ["luaBracket"] = {
    link = "Delimiter",
  },
  ["luaBrackets"] = {
    link = "Delimiter",
  },
  ["luaIfThen"] = {
    link = "Conditional",
  },
  ["luaElse"] = {
    link = "Conditional",
  },
  ["luaSpecialTable"] = {
    fg = colors.syntax.color10,
    bold = true,
  },
  ["luaFuncParen"] = {
    fg = colors.syntax.color09,
  },
  ["luaFuncParens"] = {
    fg = colors.syntax.color09,
  },
  ["luaFuncArgName"] = {
    fg = colors.syntax.color19,
  },
  ["luaTable"] = {
    fg = colors.syntax.color00,
  },
  ["luaSpecial"] = {
    fg = colors.syntax.color05,
    bold = true,
  },
  ["luaEllipsis"] = {
    fg = colors.syntax.color01,
    bold = true,
  },
}

-- vim:ft=lua
