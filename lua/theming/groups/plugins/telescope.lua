local T = {}

function T.get(colors)
  return {
    ["TelescopePreviewBorder"] = {
      foreground = colors.shades.shade08,
      background = colors.shades.shade08,
    },
    ["TelescopePreviewTitle"] = {
      foreground = colors.common.base01,
      background = colors.common.base14,
    },
    ["TelescopePreviewNormal"] = {
      background = colors.shades.shade08,
    },
    ["TelescopeSelectionCaret"] = {
      foreground = colors.common.base14,
      background = colors.shades.shade09,
    },
    ["TelescopeSelection"] = {
      background = colors.shades.shade09,
      foreground = colors.common.base14,
    },
    ["TelescopeResultsBorder"] = {
      background = colors.shades.shade09,
      foreground = colors.shades.shade09,
    },
    ["TelescopeResultsTitle"] = {
      background = colors.common.base15,
      foreground = colors.common.base01,
    },
    ["TelescopeResultsNormal"] = {
      background = colors.shades.shade09,
      foreground = colors.common.base04,
    },
    ["TelescopeMatching"] = {
      foreground = colors.common.base11,
    },
    ["TelescopePromptPrefix"] = {
      foreground = colors.common.base08,
      background = colors.shades.shade03,
    },
    ["TelescopePromptBorder"] = {
      background = colors.shades.shade03,
      foreground = colors.shades.shade03,
    },
    ["TelescopePromptNormal"] = {
      background = colors.shades.shade03,
      foreground = colors.common.base09,
    },
    ["TelescopePromptTitle"] = {
      foreground = colors.common.base01,
      background = colors.common.base08,
    },
    ["TelescopePromptCounter"] = {
      foreground = colors.common.base15,
    },
  }
end

return T

-- vim:ft=lua
