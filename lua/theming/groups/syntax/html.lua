local S = {}

function S.get(theme)
  return {
    htmlLink = { foreground = theme.syntax.color15, decoration = "underline" },
    htmlH1 = { foreground = theme.syntax.color09, decoration = "bold" },
    htmlH2 = { foreground = theme.syntax.color17, decoration = "bold" },
    htmlH3 = { foreground = theme.syntax.color13, decoration = "bold" },
    htmlH4 = { foreground = theme.syntax.color06, decoration = "bold" },
    htmlH5 = { foreground = theme.syntax.color00, decoration = "bold" },
  }
end

return S

-- vim:ft=lua
