return {
  setup = function(colors)
    hi("WhichKeyGroup", { guifg = colors.common.base11, gui = "italic,bold" })
    hi("WhichKeyDesc", { guifg = colors.common.base08 })
    hi("WhichKeySeparator", { guifg = colors.common.base09 })
    hi("WhichKeyValue", { guifg = colors.common.base14 })
    hi("WhichKey", { guifg = colors.common.base14 })
  end,
}

-- vim:ft=lua
