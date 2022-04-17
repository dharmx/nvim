local T = {}

function T.get(colors)
  return {
    ["TelescopePreviewBorder"] = {
      guifg = colors.shades.shade08,
      guibg = colors.shades.shade08,
    },
    ["TelescopePreviewTitle"] = {
      guifg = colors.common.base01,
      guibg = colors.common.base14,
    },
    ["TelescopePreviewNormal"] = {
      guibg = colors.shades.shade08,
    },
    ["TelescopeSelectionCaret"] = {
      guifg = colors.common.base14,
      guibg = colors.shades.shade09,
    },
    ["TelescopeSelection"] = {
      guibg = colors.shades.shade09,
      guifg = colors.common.base14,
    },
    ["TelescopeResultsBorder"] = {
      guibg = colors.shades.shade09,
      guifg = colors.shades.shade09,
    },
    ["TelescopeResultsTitle"] = {
      guibg = colors.common.base15,
      guifg = colors.common.base01,
    },
    ["TelescopeResultsNormal"] = {
      guibg = colors.shades.shade09,
      guifg = colors.common.base04,
    },
    ["TelescopeMatching"] = {
      guifg = colors.common.base11,
    },
    ["TelescopePromptPrefix"] = {
      guifg = colors.common.base08,
      guibg = colors.shades.shade03,
    },
    ["TelescopePromptBorder"] = {
      guibg = colors.shades.shade03,
      guifg = colors.shades.shade03,
    },
    ["TelescopePromptNormal"] = {
      guibg = colors.shades.shade03,
      guifg = colors.common.base09,
    },
    ["TelescopePromptTitle"] = {
      guifg = colors.common.base01,
      guibg = colors.common.base08,
    },
    ["TelescopePromptCounter"] = {
      guifg = colors.common.base15,
    },
  }
end

return T

-- vim:ft=lua
