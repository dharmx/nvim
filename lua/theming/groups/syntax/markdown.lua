return {
  setup = function(colors)
    hi("markdownH1", { guifg = colors.syntax.color00, gui = "bold" })
    hi("markdownH2", { guifg = colors.syntax.color02, gui = "bold" })
    hi("markdownH3", { guifg = colors.syntax.color03, gui = "bold" })
    hi("markdownH1Delimiter", { guifg = colors.syntax.color16 })
    hi("markdownH2Delimiter", { guifg = colors.syntax.color17 })
    hi("markdownH3Delimiter", { guifg = colors.syntax.color15 })
  end,
}

-- vim:ft=lua
