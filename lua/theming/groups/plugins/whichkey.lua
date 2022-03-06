local W = {}

function W.get(theme)
  return {
    WhichKeyFloat = { background = theme.shades.shade05 },
    WhichKeyGroup = { foreground = theme.common.base11 },
    WhichKeyDesc = { foreground = theme.common.base08 },
    WhichKeySeparator = { foreground = theme.common.base09 },
    WhichKeyValue = { foreground = theme.common.base14 },
    WhichKey = { foreground = theme.common.base14 },
  }
end

return W
