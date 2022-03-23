local H = {}

function H.get(theme)
  return {
    ["LightBulbFloatWin"] = {
      foreground = theme.common.base09,
      background = theme.shades.shade08,
      decoration = "bold",
    },
    ["LightBulbVirtualText"] = {
      foreground = theme.common.base12,
      decoration = "bold",
    },
  }
end

return H

-- vim:ft=lua
