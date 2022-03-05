local W = {}

function W.get(theme)
  return {
    WhichKeyFloat = { background = theme.shades.shade05, foreground = theme.common.base09 },
    WhichKeyGroup = { foreground = theme.common.base11 },
    WhichKeyDesc = { foreground = theme.common.base08 },
    WhichKeySeparator = { foreground = theme.shades.shade01 },
    WhichKeySeperator = { foreground = theme.common.base13 },
    WhichKeyValue = { foreground = theme.common.base14, decoration = "bold" },
    WhichKey = { foreground = theme.common.base14 },
    WhichKeyFloating = { background = theme.common.base00 },
  }
end

return W
