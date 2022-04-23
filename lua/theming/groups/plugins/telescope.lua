return {
  setup = function(colors)
    hi("TelescopePreviewBorder", { guifg = colors.shades.shade08, guibg = colors.shades.shade08, blend = 2 })
    hi("TelescopePreviewTitle", { guifg = colors.common.base01, guibg = colors.common.base14, blend = 2 })
    hi("TelescopePreviewNormal", { guibg = colors.shades.shade08, blend = 2 })
    hi("TelescopeSelectionCaret", { guifg = colors.common.base14, guibg = colors.shades.shade09, blend = 2 })
    hi("TelescopeSelection", {
      guibg = colors.shades.shade09,
      guifg = colors.common.base14,
      blend = 2,
    })
    hi("TelescopeResultsBorder", { guibg = colors.shades.shade09, guifg = colors.shades.shade09, blend = 2 })
    hi("TelescopeResultsTitle", { guibg = colors.common.base15, guifg = colors.common.base01, blend = 2 })
    hi("TelescopeResultsNormal", { guibg = colors.shades.shade09, guifg = colors.common.base04, blend = 2 })
    hi("TelescopeMatching", { guifg = colors.common.base11, blend = 2 })
    hi("TelescopePromptPrefix", { guifg = colors.common.base08, blend = 2, guibg = colors.shades.shade03 })
    hi("TelescopePromptBorder", { guibg = colors.shades.shade03, guifg = colors.shades.shade03, blend = 2 })
    hi("TelescopePromptNormal", { guibg = colors.shades.shade03, guifg = colors.common.base09, blend = 2 })
    hi("TelescopePromptTitle", {
      guifg = colors.common.base01,
      guibg = colors.common.base08,
      blend = 2,
    })
    hi("TelescopePromptCounter", { guifg = colors.common.base15, blend = 2 })
  end,
}

-- vim:ft=lua
