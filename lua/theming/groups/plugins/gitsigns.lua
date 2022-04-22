return {
  setup = function(colors)
    hi("GitSignsChange", { guifg = colors.common.base02 })
    hi("GitSignsChangeNr", { guifg = colors.common.base15 })
    hi("GitSignsChangeLn", { guifg = colors.common.base15 })
    hi("GitSignsAdd", { guifg = colors.common.base09 })
    hi("GitSignsAddNr", { guifg = colors.common.base14 })
    hi("GitSignsAddLn", { guifg = colors.common.base14 })
    hi("GitSignsDeleteLn", { guifg = colors.common.base11 })
    hi("GitSignsDelete", { guifg = colors.common.base11 })
    hi("GitSignsDeleteNr", { guifg = colors.common.base11 })
  end,
}

-- vim:ft=lua
