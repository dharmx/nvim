local T = {}

function T.get(theme)
  return {
    ["TelescopePreviewBorder"] = {
      foreground = theme.shades.shade08,
      background = theme.shades.shade08,
    },
    ["TelescopePreviewTitle"] = {
      foreground = theme.common.base01,
      background = theme.common.base09,
    },
    ["TelescopePreviewNormal"] = {
      background = theme.shades.shade08,
    },
    ["TelescopeSelectionCaret"] = {
      foreground = theme.common.base14,
      background = theme.shades.shade09,
    },
    ["TelescopeSelection"] = {
      background = theme.shades.shade09,
      foreground = theme.common.base14,
    },
    ["TelescopeResultsBorder"] = {
      background = theme.shades.shade09,
      foreground = theme.shades.shade09,
    },
    ["TelescopeResultsTitle"] = {
      background = theme.shades.shade09,
      foreground = theme.shades.shade09,
    },
    ["TelescopeResultsNormal"] = {
      background = theme.shades.shade09,
      foreground = theme.common.base04,
    },
    ["TelescopeMatching"] = {
      foreground = theme.common.base11,
    },
    ["TelescopePromptPrefix"] = {
      foreground = theme.common.base09,
      background = theme.shades.shade03,
    },
    ["TelescopePromptBorder"] = {
      background = theme.shades.shade03,
      foreground = theme.shades.shade03,
    },
    ["TelescopePromptNormal"] = {
      background = theme.shades.shade03,
      foreground = theme.common.base09,
    },
    ["TelescopePromptTitle"] = {
      foreground = theme.common.base01,
      background = theme.common.base11,
    },
    ["TelescopePromptCounter"] = {
      foreground = theme.common.base02,
    },
  }
end

return T

-- vim:ft=lua
