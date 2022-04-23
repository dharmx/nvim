return {
  setup = function(colors)
    hi("luaBuiltIn", { link = "Keyword" })
    hi("luaDocTag", { guifg = colors.syntax.color15, gui = "bold" })
    hi("luaFuncTable", { guifg = colors.syntax.color06, gui = "bold" })
    hi("luaCond", { link = "Conditional" })
    hi("luaIn", { link = "Keyword" })
    hi("luaCond", { link = "Conditional" })
    hi("luaParen", { link = "Delimiter" })
    hi("luaParens", { link = "Delimiter" })
    hi("luaBraces", { link = "Delimiter" })
    hi("luaBracket", { link = "Delimiter" })
    hi("luaBrackets", { link = "Delimiter" })
    hi("luaIfThen", { link = "Conditional" })
    hi("luaElse", { link = "Conditional" })
    hi("luaSpecialTable", { guifg = colors.syntax.color10, gui = "bold,italic" })
    hi("luaFuncParen", { guifg = colors.syntax.color09 })
    hi("luaFuncParens", { guifg = colors.syntax.color09 })
    hi("luaFuncArgName", { guifg = colors.syntax.color19 })
    hi("luaTable", { guifg = colors.syntax.color00 })
    hi("luaSpecial", { guifg = colors.syntax.color05, gui = "bold" })
    hi("luaEllipsis", { guifg = colors.syntax.color01, gui = "bold" })
  end,
}

-- vim:ft=lua
