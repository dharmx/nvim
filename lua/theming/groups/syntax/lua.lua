local S = {}

function S.get(syntax)
  return {
    luaBuiltIn = { link = "Keyword" },
    luaDocTag = { foreground = syntax.color15, decoration = "bold" },
    luaFuncTable = { foreground = syntax.color06, decoration = "bold" },
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
    luaSpecialTable = { foreground = syntax.color10, decoration = "bold" },
    luaFuncParen = { foreground = syntax.color09 },
    luaFuncParens = { foreground = syntax.color09 },
    luaFuncArgName = { foreground = syntax.color19 },
    luaTable = { foreground = syntax.color00 },
    luaSpecial = { foreground = syntax.color05, decoration = "bold" },
    luaEllipsis = { foreground = syntax.color01, decoration = "bold" },
  }
end

return S

-- vim:ft=lua
