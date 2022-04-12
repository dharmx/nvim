local B = {}

function B.get(colors)
  return {
    ["BufferLineTabClose"] = { foreground = colors.shades.shade06, background = colors.shades.shade06 },
    ["BufferLineFill"] = { foreground = colors.shades.shade3, background = colors.shades.shade06 },
    ["BufferLineBackground"] = { foreground = colors.shades.shade00, background = colors.shades.shade06 },
    ["BufferLineTab"] = { foreground = colors.common.base09, background = colors.shades.shade06 },
    ["BufferLineTabSelected"] = { foreground = colors.common.base01, background = colors.common.base09 },
    ["BufferLineCloseButton"] = { foreground = colors.common.base09, background = colors.shades.shade06 },
    ["BufferLineCloseButtonVisible"] = { foreground = colors.common.base15, background = colors.shades.shade06 },
    ["BufferLineCloseButtonSelected"] = { foreground = colors.common.base11, background = colors.common.base00 },
    ["BufferLineBufferVisible"] = { foreground = colors.common.base15, background = colors.shades.shade06 },
    ["BufferLineBufferSelected"] = {
      foreground = colors.common.base09,
      background = colors.common.base00,
      decoration = "bold",
    },
    ["BufferLineSeparator"] = { foreground = colors.shades.shade06, background = colors.shades.shade06 },
    ["BufferLineSeparatorSelected"] = { foreground = colors.common.base09, background = colors.common.base09 },
    ["BufferLineSeparatorVisible"] = { foreground = colors.shades.shade06, background = colors.shades.shade06 },
    ["BufferLineIndicatorSelected"] = { foreground = colors.common.base00, background = colors.common.base00 },
    ["BufferLineModified"] = { foreground = colors.common.base09, background = colors.shades.shade06 },
    ["BufferLineModifiedVisible"] = { foreground = colors.common.base15, background = colors.shades.shade06 },
    ["BufferLineModifiedSelected"] = { foreground = colors.common.base14, background = colors.common.base00 },
    ["BufferLineDuplicateSelected"] = {
      foreground = colors.common.base09,
      background = colors.common.base00,
      decoration = "bold",
    },
    ["BufferLineDuplicateVisible"] = {
      foreground = colors.common.base15,
      background = colors.shades.shade06,
    },
    ["BufferLineDuplicate"] = { foreground = colors.common.base03, background = colors.shades.shade06 },
    ["BufferLinePickSelected"] = {
      foreground = colors.common.base01,
      background = colors.common.base08,
      decoration = "bold",
    },
    ["BufferLinePickVisible"] = {
      foreground = colors.common.base01,
      background = colors.common.base15,
      decoration = "bold",
    },
    ["BufferLinePick"] = { foreground = colors.common.base01, background = colors.common.base09, decoration = "bold" },
  }
end

return B

-- vim:ft=lua
