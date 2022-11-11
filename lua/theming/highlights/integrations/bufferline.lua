local colors = require("utils.theming").get_active_theme()

return {
  ["BufferLineTabClose"] = {
    fg = colors.shades.shade06,
    bg = colors.shades.shade06,
  },
  ["BufferLineFill"] = {
    fg = colors.shades.shade01,
    bg = colors.shades.shade06,
  },
  ["BufferLineBackground"] = {
    fg = colors.shades.shade00,
    bg = colors.shades.shade06,
  },
  ["BufferLineTab"] = {
    fg = colors.common.base09,
    bg = colors.shades.shade06,
  },
  ["BufferLineTabSelected"] = {
    fg = colors.common.base01,
    bg = colors.common.base09,
  },
  ["BufferLineCloseButton"] = {
    fg = colors.common.base09,
    bg = colors.shades.shade06,
  },
  ["BufferLineCloseButtonVisible"] = {
    fg = colors.common.base15,
    bg = colors.shades.shade06,
  },
  ["BufferLineCloseButtonSelected"] = {
    fg = colors.common.base11,
    bg = colors.common.base00,
  },
  ["BufferLineBufferVisible"] = {
    fg = colors.common.base15,
    bg = colors.shades.shade06,
  },
  ["BufferLineBufferSelected"] = {
    fg = colors.common.base09,
    bg = colors.common.base00,
    bold = true,
  },
  ["BufferLineSeparator"] = {
    fg = colors.shades.shade06,
    bg = colors.shades.shade06,
  },
  ["BufferLineSeparatorSelected"] = {
    fg = colors.common.base09,
    bg = colors.common.base09,
  },
  ["BufferLineSeparatorVisible"] = {
    fg = colors.shades.shade06,
    bg = colors.shades.shade06,
  },
  ["BufferLineIndicatorSelected"] = {
    fg = colors.common.base00,
    bg = colors.common.base00,
  },
  ["BufferLineModified"] = {
    fg = colors.common.base09,
    bg = colors.shades.shade06,
  },
  ["BufferLineModifiedVisible"] = {
    fg = colors.common.base15,
    bg = colors.shades.shade06,
  },
  ["BufferLineModifiedSelected"] = {
    fg = colors.common.base14,
    bg = colors.common.base00,
  },
  ["BufferLineDuplicateSelected"] = {
    fg = colors.common.base09,
    bg = colors.common.base00,
    bold = true,
  },
  ["BufferLineDuplicateVisible"] = {
    fg = colors.common.base15,
    bg = colors.shades.shade06,
  },
  ["BufferLineDuplicate"] = {
    fg = colors.common.base03,
    bg = colors.shades.shade06,
  },
  ["BufferLinePickSelected"] = {
    fg = colors.common.base01,
    bg = colors.common.base08,
    bold = true,
  },
  ["BufferLinePickVisible"] = {
    fg = colors.common.base01,
    bg = colors.common.base15,
    bold = true,
  },
  ["BufferLinePick"] = {
    fg = colors.common.base01,
    bg = colors.common.base09,
    bold = true,
  },
  ["BufferLineDiagnostic"] = {
    fg = colors.common.base03,
    bg = colors.shades.shade10,
  },
  ["BufferLineDocsSeparator"] = {
    fg = colors.common.base09,
    bg = colors.shades.shade09,
  },
  ["BufferLineDocsSelected"] = {
    fg = colors.common.base09,
    bg = colors.shades.shade09,
  },
  ["BufferLineDocsLabel"] = {
    fg = colors.shades.shade09,
    bg = colors.common.base09,
  },
  ["BufferLineDocs"] = {
    fg = colors.common.base04,
    bg = colors.shades.shade12,
  },
  ["BufferLineDocsVisible"] = {
    fg = colors.common.base04,
    bg = colors.shades.shade10,
  },
}

-- vim:ft=lua
