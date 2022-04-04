local S = {}

function S.get(colors)
  return {
    luaBuiltIn = { link = "Keyword" },
    luaDocTag = { foreground = colors.syntax.color15, decoration = "bold" },
    luaFuncTable = { foreground = colors.syntax.color06, decoration = "bold" },
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
    luaSpecialTable = { foreground = colors.syntax.color10, decoration = "bold" },
    luaFuncParen = { foreground = colors.syntax.color09 },
    luaFuncParens = { foreground = colors.syntax.color09 },
    luaFuncArgName = { foreground = colors.syntax.color19 },
    luaTable = { foreground = colors.syntax.color00 },
    luaSpecial = { foreground = colors.syntax.color05, decoration = "bold" },
    luaEllipsis = { foreground = colors.syntax.color01, decoration = "bold" },
  }
end

return S

-- vim:ft=lua
