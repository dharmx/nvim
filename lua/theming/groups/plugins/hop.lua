local H = {}

function H.get(theme)
  return {
    ["HopNextKey"] = { foreground = theme.common.base08, decoration = "bold" },
    ["HopNextKey1"] = { foreground = theme.common.base07, decoration = "bold" },

    ["HopNextKey2"] = { foreground = theme.common.base07 },
    ["HopUnmatched"] = { foreground = theme.common.base03 },
  }
end

return H

-- vim:ft=lua

