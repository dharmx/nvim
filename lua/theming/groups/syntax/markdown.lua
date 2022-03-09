local S = {}

function S.get(syntax)
  return {
    markdownH1 = { foreground = syntax.color00, decoration = "bold" },
    markdownH2 = { foreground = syntax.color02, decoration = "bold" },
    markdownH3 = { foreground = syntax.color03, decoration = "bold" },

    markdownH1Delimiter = { foreground = syntax.color16 },
    markdownH2Delimiter = { foreground = syntax.color17 },
    markdownH3Delimiter = { foreground = syntax.color15 },
  }
end

return S

-- vim:ft=lua
