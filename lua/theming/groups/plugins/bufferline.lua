local B = {}

function B.get(theme)
  return {
    ["BufferLineTabClose"] = { foreground = theme.shades.shade06, background = theme.shades.shade06 },
    BufferLineFill = { foreground = theme.shades.shade3, background = theme.shades.shade06 },
    BufferLineBackground = { foreground = theme.shades.shade03, background = theme.shades.shade06 },
    BufferLineTab = { foreground = theme.common.base09, background = theme.shades.shade06 },
    BufferLineTabSelected = { foreground = theme.common.base01, background = theme.common.base09 },
    BufferLineCloseButton = { foreground = theme.common.base09, background = theme.shades.shade06 },
    BufferLineCloseButtonVisible = { foreground = theme.common.base15, background = theme.common.base01 },
    BufferLineCloseButtonSelected = { foreground = theme.common.base11, background = theme.common.base00 },
    BufferLineBufferVisible = { foreground = theme.common.base15, background = theme.common.base01 },
    BufferLineBufferSelected = {
      foreground = theme.common.base09,
      background = theme.common.base00,
      decoration = "bold",
    },
    BufferLineSeparator = { foreground = theme.shades.shade06, background = theme.shades.shade06 },
    BufferLineSeparatorSelected = { foreground = theme.common.base09, background = theme.common.base09 },
    BufferLineSeparatorVisible = { foreground = theme.shades.shade06, background = theme.shades.shade06 },
    BufferLineIndicatorSelected = { foreground = theme.common.base00, background = theme.common.base00 },
    BufferLineModified = { foreground = theme.common.base09, background = theme.shades.shade06 },
    BufferLineModifiedVisible = { foreground = theme.common.base15, background = theme.common.base01 },
    BufferLineModifiedSelected = { foreground = theme.common.base14, background = theme.common.base00 },
    BufferLineDuplicateSelected = {
      foreground = theme.common.base09,
      background = theme.common.base00,
      decoration = "bold",
    },
    BufferLineDuplicateVisible = {
      foreground = theme.common.base15,
      background = theme.common.base01,
    },
    BufferLineDuplicate = { foreground = theme.common.base03, background = theme.shades.shade06 },
    BufferLinePickSelected = {
      foreground = theme.common.base01,
      background = theme.common.base08,
      decoration = "bold",
    },
    BufferLinePickVisible = {
      foreground = theme.common.base01,
      background = theme.common.base15,
      decoration = "bold",
    },
    BufferLinePick = { foreground = theme.common.base01, background = theme.common.base09, decoration = "bold" },
  }
end

return B
