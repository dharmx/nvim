local H = {}

function H.get(colors)
  return {
    ["LightBulbFloatWin"] = {
      guifg = colors.common.base09,
      guibg = colors.shades.shade08,
      gui = "bold",
    },
    ["LightBulbVirtualText"] = {
      guifg = colors.common.base12,
      gui = "bold",
    },
  }
end

return H

-- vim:ft=lua
