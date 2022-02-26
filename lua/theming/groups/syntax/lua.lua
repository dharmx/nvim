local S = {}

function S.get(syntax)
  return {
    luaBuiltIn = { link = "Keyword" },
    luaCond = { link = "Conditional" },
    luaIn = { link = "Keyword" },
    luaCond = { link = "Conditional" },
    luaIfThen = { link = "Conditional" },
    luaElse = { link = "Conditional" },
    luaSpecialTable = { foreground = syntax.color11, decoration = "bold" },
    luaSpecial = { foreground = syntax.color05, decoration = "bold" },
  }
end

return S
