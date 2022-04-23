return {
  setup = function(colors)
    hi("BufferLineTabClose", { guifg = colors.shades.shade06, guibg = colors.shades.shade06 })
    hi("BufferLineFill", { guifg = colors.shades.shade3, guibg = colors.shades.shade06 })
    hi("BufferLineBackground", { guifg = colors.shades.shade00, guibg = colors.shades.shade06, gui = "italic" })
    hi("BufferLineTab", { guifg = colors.common.base09, guibg = colors.shades.shade06 })
    hi("BufferLineTabSelected", { guifg = colors.common.base01, guibg = colors.common.base09 })
    hi("BufferLineCloseButton", { guifg = colors.common.base09, guibg = colors.shades.shade06 })
    hi("BufferLineCloseButtonVisible", { guifg = colors.common.base15, guibg = colors.shades.shade06 })
    hi("BufferLineCloseButtonSelected", { guifg = colors.common.base11, guibg = colors.common.base00 })
    hi("BufferLineBufferVisible", { guifg = colors.common.base15, guibg = colors.shades.shade06, gui = "italic" })
    hi("BufferLineBufferSelected", { guifg = colors.common.base09, guibg = colors.common.base00, gui = "italic,bold" })
    hi("BufferLineSeparator", { guifg = colors.shades.shade06, guibg = colors.shades.shade06 })
    hi("BufferLineSeparatorSelected", { guifg = colors.common.base09, guibg = colors.common.base09 })
    hi("BufferLineSeparatorVisible", { guifg = colors.shades.shade06, guibg = colors.shades.shade06 })
    hi("BufferLineIndicatorSelected", { guifg = colors.common.base00, guibg = colors.common.base00 })
    hi("BufferLineModified", { guifg = colors.common.base09, guibg = colors.shades.shade06 })
    hi("BufferLineModifiedVisible", { guifg = colors.common.base15, guibg = colors.shades.shade06 })
    hi("BufferLineModifiedSelected", { guifg = colors.common.base14, guibg = colors.common.base00 })
    hi("BufferLineDuplicateSelected", { guifg = colors.common.base09, guibg = colors.common.base00, gui = "bold" })
    hi("BufferLineDuplicateVisible", { guifg = colors.common.base15, guibg = colors.shades.shade06 })
    hi("BufferLineDuplicate", { guifg = colors.common.base03, guibg = colors.shades.shade06 })
    hi("BufferLinePickSelected", { guifg = colors.common.base01, guibg = colors.common.base08, gui = "bold" })
    hi("BufferLinePickVisible", { guifg = colors.common.base01, guibg = colors.common.base15, gui = "bold" })
    hi("BufferLinePick", { guifg = colors.common.base01, guibg = colors.common.base09, gui = "bold" })
  end,
}

-- vim:ft=lua
