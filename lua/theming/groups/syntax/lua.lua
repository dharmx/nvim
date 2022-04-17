local S = {}

function S.get(colors)
  return {
    luaBuiltIn = { link = "Keyword" },
    luaDocTag = { guifg = colors.syntax.color15, gui = "bold" },
    luaFuncTable = { guifg = colors.syntax.color06, gui = "bold" },
    luaCond = { link = "Conditional" },
    luaIn = { link = "Keyword" },
    luaCond = { link = "Conditional" },
    luaParen = { link = "Delimiter" },
    luaParens = { link = "Delimiter" },
    luaBraces = { link = "Delimiter" },
    luaBracket = { link = "Delimiter" },
    luaBrackets = { link = "Delimiter" },
    luaIfThen = { link = "Conditional" },
    luaElse = { link = "Conditional" },
    luaSpecialTable = { guifg = colors.syntax.color10, gui = "bold" },
    luaFuncParen = { guifg = colors.syntax.color09 },
    luaFuncParens = { guifg = colors.syntax.color09 },
    luaFuncArgName = { guifg = colors.syntax.color19 },
    luaTable = { guifg = colors.syntax.color00 },
    luaSpecial = { guifg = colors.syntax.color05, gui = "bold" },
    luaEllipsis = { guifg = colors.syntax.color01, gui = "bold" },
  }
end

return S

-- vim:ft=lua
