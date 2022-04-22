return {
  setup = function(colors)
    hi("AlphaKeyPrefix", { guifg = colors.common.base01, guibg = colors.common.base09, gui = "bold" })
    hi("AlphaHeading", { guifg = colors.shades.shade02 })
    hi("AlphaLoaded", { guifg = colors.shades.shade02 })
    hi("AlphaFooting", { guifg = colors.common.base15, gui = "bold" })
    hi("AlphaScroll", { guifg = colors.common.base15 })
    hi("AlphaButtonLabelText", { guifg = colors.common.base08 })
  end,
}

-- vim:ft=lua
