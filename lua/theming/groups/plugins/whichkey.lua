local W = {}

function W.get(colors)
  return {
    ["WhichKeyFloat"] = { background = colors.shades.shade05 },
    ["WhichKeyGroup"] = { foreground = colors.common.base11 },
    ["WhichKeyDesc"] = { foreground = colors.common.base08 },
    ["WhichKeySeparator"] = { foreground = colors.common.base09 },
    ["WhichKeyValue"] = { foreground = colors.common.base14 },
    ["WhichKey"] = { foreground = colors.common.base14 },
  }
end

return W

-- vim:ft=lua
