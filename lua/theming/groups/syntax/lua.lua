local S = {}

function S.get(theme)
  return {
    luaBuiltIn = { link = "Keyword" },
    luaDocTag = { foreground = theme.syntax.color15, decoration = "bold" },
    luaFuncTable = { foreground = theme.syntax.color06, decoration = "bold" },
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
    luaSpecialTable = { foreground = theme.syntax.color10, decoration = "bold" },
    luaFuncParen = { foreground = theme.syntax.color09 },
    luaFuncParens = { foreground = theme.syntax.color09 },
    luaFuncArgName = { foreground = theme.syntax.color19 },
    luaTable = { foreground = theme.syntax.color00 },
    luaSpecial = { foreground = theme.syntax.color05, decoration = "bold" },
    luaEllipsis = { foreground = theme.syntax.color01, decoration = "bold" },
  }
end

return S

-- vim:ft=lua
