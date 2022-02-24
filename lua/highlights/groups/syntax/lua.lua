local S = {}

function S.get(syntax)
  return {
    luaBuiltIn = { link = "Keyword" },
    luaCond = { link = "Conditional" },
    luaIn = { link = "Keyword" },
    luaSpecial = { foreground = syntax.color05, decoration = "bold" },
    luaSpecialTable = { foreground = syntax.color11, decoration = "bold" },
    luaCond = { link = "Conditional" },
    luaIfThen = { link = "Conditional" },
    luaElse = { link = "Conditional" },
  }
end

return S
