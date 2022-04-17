local H = {}

function H.get(colors)
  return {
    ["HopNextKey"] = { guifg = colors.common.base08, gui = "bold" },
    ["HopNextKey1"] = { guifg = colors.common.base07, gui = "bold" },

    ["HopNextKey2"] = { guifg = colors.common.base07 },
    ["HopUnmatched"] = { guifg = colors.common.base03 },
  }
end

return H

-- vim:ft=lua
