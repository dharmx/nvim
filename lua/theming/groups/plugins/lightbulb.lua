local H = {}

function H.get(colors)
  return {
    ["LightBulbFloatWin"] = {
      foreground = colors.common.base09,
      background = colors.shades.shade08,
      decoration = "bold",
    },
    ["LightBulbVirtualText"] = {
      foreground = colors.common.base12,
      decoration = "bold",
    },
  }
end

return H

-- vim:ft=lua
