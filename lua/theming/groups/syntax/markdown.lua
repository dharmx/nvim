local S = {}

function S.get(colors)
  return {
    markdownH1 = { foreground = colors.syntax.color00, decoration = "bold" },
    markdownH2 = { foreground = colors.syntax.color02, decoration = "bold" },
    markdownH3 = { foreground = colors.syntax.color03, decoration = "bold" },

    markdownH1Delimiter = { foreground = colors.syntax.color16 },
    markdownH2Delimiter = { foreground = colors.syntax.color17 },
    markdownH3Delimiter = { foreground = colors.syntax.color15 },
  }
end

return S

-- vim:ft=lua
