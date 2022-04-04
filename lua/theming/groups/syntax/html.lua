local S = {}

function S.get(colors)
  return {
    htmlLink = { foreground = colors.syntax.color15, decoration = "underline" },
    htmlH1 = { foreground = colors.syntax.color09, decoration = "bold" },
    htmlH2 = { foreground = colors.syntax.color17, decoration = "bold" },
    htmlH3 = { foreground = colors.syntax.color13, decoration = "bold" },
    htmlH4 = { foreground = colors.syntax.color06, decoration = "bold" },
    htmlH5 = { foreground = colors.syntax.color00, decoration = "bold" },
  }
end

return S

-- vim:ft=lua
