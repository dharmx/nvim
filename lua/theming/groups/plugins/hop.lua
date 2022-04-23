return {
  setup = function(colors)
    hi("HopNextKey", { guifg = colors.common.base08, gui = "bold" })
    hi("HopNextKey1", { guifg = colors.common.base07, gui = "bold" })
    hi("HopNextKey2", { guifg = colors.common.base07 })
    hi("HopUnmatched", { guifg = colors.common.base03 })
  end,
}

-- vim:ft=lua
