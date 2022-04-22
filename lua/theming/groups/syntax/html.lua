return {
  setup = function(colors)
    hi("htmlLink", { guifg = colors.syntax.color15, gui = "underline" })
    hi("htmlH1", { guifg = colors.syntax.color09, gui = "bold" })
    hi("htmlH2", { guifg = colors.syntax.color17, gui = "bold" })
    hi("htmlH3", { guifg = colors.syntax.color13, gui = "bold" })
    hi("htmlH4", { guifg = colors.syntax.color06, gui = "bold" })
    hi("htmlH5", { guifg = colors.syntax.color00, gui = "bold" })
  end,
}

-- vim:ft=lua
