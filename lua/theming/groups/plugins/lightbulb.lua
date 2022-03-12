local H = {}

function H.get(theme)
  return {
    ["LightBulbFloatWin"] = { foreground = theme.common.base09, decoration = "bold" },
    ["LightBulbVirtualText"] = { foreground = theme.common.base13, decoration = "bold" },
  }
end

return H

-- vim:ft=lua
