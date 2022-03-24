local D = {}

function D.get(theme)
  return {
    AlphaKeyPrefix = { foreground = theme.common.base01, background = theme.common.base09, decoration = "bold" },
    AlphaHeading = { foreground = theme.shades.shade02 },
    AlphaLoaded = { foreground = theme.shades.shade02 },
    AlphaFooting = { foreground = theme.common.base15, decoration = "bold" },
    AlphaScroll = { foreground = theme.common.base15 },
  }
end

return D

-- vim:ft=lua
