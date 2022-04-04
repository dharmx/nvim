local H = {}

function H.get(colors)
  return {
    ["HopNextKey"] = { foreground = colors.common.base08, decoration = "bold" },
    ["HopNextKey1"] = { foreground = colors.common.base07, decoration = "bold" },

    ["HopNextKey2"] = { foreground = colors.common.base07 },
    ["HopUnmatched"] = { foreground = colors.common.base03 },
  }
end

return H

-- vim:ft=lua
