local W = {}

function W.get(colors)
  return {
    ["TreesitterContext"] = { guibg = colors.common.base01, blend = 8 },
  }
end

return W

-- vim:ft=lua
