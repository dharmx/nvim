local S = {}

function S.get(theme)
  return {
    markdownH1 = { foreground = theme.syntax.color00, decoration = "bold" },
    markdownH2 = { foreground = theme.syntax.color02, decoration = "bold" },
    markdownH3 = { foreground = theme.syntax.color03, decoration = "bold" },

    markdownH1Delimiter = { foreground = theme.syntax.color16 },
    markdownH2Delimiter = { foreground = theme.syntax.color17 },
    markdownH3Delimiter = { foreground = theme.syntax.color15 },
  }
end

return S

-- vim:ft=lua
