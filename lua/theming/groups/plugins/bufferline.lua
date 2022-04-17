local B = {}

function B.get(colors)
  return {
    ["BufferLineTabClose"] = { guifg = colors.shades.shade06, guibg = colors.shades.shade06 },
    ["BufferLineFill"] = { guifg = colors.shades.shade3, guibg = colors.shades.shade06 },
    ["BufferLineBackground"] = { guifg = colors.shades.shade00, guibg = colors.shades.shade06 },
    ["BufferLineTab"] = { guifg = colors.common.base09, guibg = colors.shades.shade06 },
    ["BufferLineTabSelected"] = { guifg = colors.common.base01, guibg = colors.common.base09 },
    ["BufferLineCloseButton"] = { guifg = colors.common.base09, guibg = colors.shades.shade06 },
    ["BufferLineCloseButtonVisible"] = { guifg = colors.common.base15, guibg = colors.shades.shade06 },
    ["BufferLineCloseButtonSelected"] = { guifg = colors.common.base11, guibg = colors.common.base00 },
    ["BufferLineBufferVisible"] = { guifg = colors.common.base15, guibg = colors.shades.shade06 },
    ["BufferLineBufferSelected"] = {
      guifg = colors.common.base09,
      guibg = colors.common.base00,
      gui = "bold",
    },
    ["BufferLineSeparator"] = { guifg = colors.shades.shade06, guibg = colors.shades.shade06 },
    ["BufferLineSeparatorSelected"] = { guifg = colors.common.base09, guibg = colors.common.base09 },
    ["BufferLineSeparatorVisible"] = { guifg = colors.shades.shade06, guibg = colors.shades.shade06 },
    ["BufferLineIndicatorSelected"] = { guifg = colors.common.base00, guibg = colors.common.base00 },
    ["BufferLineModified"] = { guifg = colors.common.base09, guibg = colors.shades.shade06 },
    ["BufferLineModifiedVisible"] = { guifg = colors.common.base15, guibg = colors.shades.shade06 },
    ["BufferLineModifiedSelected"] = { guifg = colors.common.base14, guibg = colors.common.base00 },
    ["BufferLineDuplicateSelected"] = {
      guifg = colors.common.base09,
      guibg = colors.common.base00,
      gui = "bold",
    },
    ["BufferLineDuplicateVisible"] = {
      guifg = colors.common.base15,
      guibg = colors.shades.shade06,
    },
    ["BufferLineDuplicate"] = { guifg = colors.common.base03, guibg = colors.shades.shade06 },
    ["BufferLinePickSelected"] = {
      guifg = colors.common.base01,
      guibg = colors.common.base08,
      gui = "bold",
    },
    ["BufferLinePickVisible"] = {
      guifg = colors.common.base01,
      guibg = colors.common.base15,
      gui = "bold",
    },
    ["BufferLinePick"] = { guifg = colors.common.base01, guibg = colors.common.base09, gui = "bold" },
  }
end

return B

-- vim:ft=lua
