return {
  setup = function(colors)
    hi("LightBulbFloatWin", { guifg = colors.common.base09, guibg = colors.shades.shade08, gui = "bold,italic" })
    hi("LightBulbVirtualText", { guifg = colors.common.base12, gui = "bold,italic" })
  end,
}

-- vim:ft=lua
