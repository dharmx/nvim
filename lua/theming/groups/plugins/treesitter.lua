local W = {}

function W.get(colors)
  return {
    ["TreesitterContext"] = { guibg = colors.shades.shade03, blend = 8 },
  }
end

return W

-- vim:ft=lua
