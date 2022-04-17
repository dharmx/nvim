local S = {}

function S.get(colors)
  return {
    markdownH1 = { guifg = colors.syntax.color00, gui = "bold" },
    markdownH2 = { guifg = colors.syntax.color02, gui = "bold" },
    markdownH3 = { guifg = colors.syntax.color03, gui = "bold" },

    markdownH1Delimiter = { guifg = colors.syntax.color16 },
    markdownH2Delimiter = { guifg = colors.syntax.color17 },
    markdownH3Delimiter = { guifg = colors.syntax.color15 },
  }
end

return S

-- vim:ft=lua
