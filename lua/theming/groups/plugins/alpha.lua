local D = {}

function D.get(colors)
  return {
    ["AlphaKeyPrefix"] = { foreground = colors.common.base01, background = colors.common.base09, decoration = "bold" },
    ["AlphaHeading"] = { foreground = colors.shades.shade02 },
    ["AlphaLoaded"] = { foreground = colors.shades.shade02 },
    ["AlphaFooting"] = { foreground = colors.common.base15, decoration = "bold" },
    ["AlphaScroll"] = { foreground = colors.common.base15 },
    ["AlphaButtonLabelText"] = { foreground = colors.common.base08 },
  }
end

return D

-- vim:ft=lua
