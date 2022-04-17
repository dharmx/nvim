local W = {}

function W.get(colors)
  return {
    ["WhichKeyFloat"] = { guibg = colors.shades.shade05 },
    ["WhichKeyGroup"] = { guifg = colors.common.base11 },
    ["WhichKeyDesc"] = { guifg = colors.common.base08 },
    ["WhichKeySeparator"] = { guifg = colors.common.base09 },
    ["WhichKeyValue"] = { guifg = colors.common.base14 },
    ["WhichKey"] = { guifg = colors.common.base14 },
  }
end

return W

-- vim:ft=lua
