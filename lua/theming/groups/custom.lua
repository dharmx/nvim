return {
  setup = function(colors)
    hi("YankFeed", { guifg = colors.rainbow.cobalt, gui = "bold" })
    hi("Hidden", { guifg = colors.common.base00, guibg = colors.common.base00 })
    hi("LightBulbSign", { guifg = colors.common.base13, guibg = colors.common.base00 })
    hi("Default", { guifg = "NONE", guibg = "NONE" })
  end,
}

-- vim:ft=lua
