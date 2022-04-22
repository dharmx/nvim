return {
  setup = function(colors)
    hi("diffAdded", { guifg = colors.common.base14 })
    hi("diffRemoved", { guifg = colors.common.base11 })
    hi("diffChanged", { guifg = colors.common.base15 })
    hi("diffOldFile", { guifg = colors.common.base13 })
    hi("diffNewFile", { guifg = colors.common.base12 })
    hi("diffFile", { guifg = colors.common.base07 })
    hi("diffLine", { guifg = colors.common.base03 })
    hi("diffIndexLine", { guifg = colors.common.base09 })
    hi("DiffAdd", { guifg = colors.common.base14 })
    hi("DiffChange", { guifg = colors.common.base15 })
    hi("DiffDelete", { guifg = colors.common.base11 })
    hi("DiffText", { guifg = colors.common.base09 })
  end,
}

-- vim:ft=lua
