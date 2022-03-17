local D = {}

function D.get(theme)
  return {
    AlphaShortCut = { foreground = theme.common.base09, style = "bold" },
    AlphaHeader = { foreground = theme.shades.shade03, decoration = "bold" },
    AlphaButtons = { foreground = theme.common.base14 },
    AlphaCenter = { foreground = theme.common.base11 },
    AlphaFooter = { foreground = theme.common.base01, decoration = "bold" },
  }
end

return D

-- vim:ft=lua
