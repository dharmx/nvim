local colors = require("utils.theming").get_active_theme()

return {
  ["TelescopePreviewBorder"] = {
    fg = colors.shades.shade12,
    bg = colors.shades.shade12,
  },
  ["TelescopePreviewTitle"] = {
    fg = colors.common.base01,
    bg = colors.common.base14,
  },
  ["TelescopePreviewNormal"] = {
    bg = colors.shades.shade12,
  },
  ["TelescopePreviewLine"] = {
    bg = colors.shades.shade05,
  },
  ["TelescopeSelectionCaret"] = {
    fg = colors.common.base14,
    bg = colors.shades.shade11,
  },
  ["TelescopeSelection"] = {
    bg = colors.shades.shade11,
    fg = colors.common.base14,
  },
  ["TelescopeResultsBorder"] = {
    bg = colors.shades.shade11,
    fg = colors.shades.shade11,
  },
  ["TelescopeResultsTitle"] = {
    bg = colors.common.base15,
    fg = colors.common.base01,
  },
  ["TelescopeResultsNormal"] = {
    bg = colors.shades.shade11,
    fg = colors.common.base04,
  },
  ["TelescopeMatching"] = {
    fg = colors.common.base11,
  },
  ["TelescopePromptPrefix"] = {
    fg = colors.common.base08,
    bg = colors.shades.shade08,
  },
  ["TelescopePromptBorder"] = {
    bg = colors.shades.shade08,
    fg = colors.shades.shade08,
  },
  ["TelescopePromptNormal"] = {
    bg = colors.shades.shade08,
    fg = colors.common.base09,
  },
  ["TelescopePromptTitle"] = {
    fg = colors.common.base01,
    bg = colors.common.base08,
  },
  ["TelescopePromptCounter"] = {
    fg = colors.common.base15,
  },
}

-- vim:ft=lua
