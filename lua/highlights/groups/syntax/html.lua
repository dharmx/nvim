local S = {}

function S.get(syntax)
  return {
    htmlLink = { foreground = syntax.color15, decoration = "underline" },
    htmlH1 = { foreground = syntax.color09, decoration = "bold" },
    htmlH2 = { foreground = syntax.color17, decoration = "bold" },
    htmlH3 = { foreground = syntax.color13, decoration = "bold" },
    htmlH4 = { foreground = syntax.color06, decoration = "bold" },
    htmlH5 = { foreground = syntax.color00, decoration = "bold" },
  }
end

return S
