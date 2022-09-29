local colors = require("utils.theming").get_active_theme()

return {
  ["NvimTreeRootFolder"] = {
    fg = colors.common.base11,
    bold = true,
  },
  ["NvimTreeGitDirty"] = {
    fg = colors.common.base15,
  },
  ["NvimTreeCursorLine"] = {
    fg = colors.syntax.color04,
    bold = true,
  },
  ["NvimTreeGitNew"] = {
    fg = colors.common.base14,
    bold = true,
  },
  ["NvimTreeExecFile"] = {
    fg = colors.common.base07,
  },
  ["NvimTreeSpecialFile"] = {
    fg = colors.common.base12,
    bold = true,
  },
  ["NvimTreeFolderName"] = {
    fg = colors.common.base09,
  },
  ["NvimTreeEmptyFolderName"] = {
    fg = colors.common.base03,
  },
  ["NvimTreeOpenedFolderName"] = {
    fg = colors.common.base10,
  },
  ["NvimTreeFolderIcon"] = {
    fg = colors.common.base09,
  },
  ["NvimTreeIndentMarker"] = {
    fg = colors.shades.shade00,
  },
  ["NvimTreeNormal"] = {
    bg = colors.shades.shade11,
  },
  ["NvimTreeRenamed"] = {
    fg = colors.common.base07,
  },
  ["NvimTreeSymlink"] = {
    fg = colors.common.base13,
  },
  ["NvimTreeVertSplit"] = {
    fg = colors.common.base00,
    bg = colors.common.base00,
  },
  ["NvimTreeWinSeparator"] = {
    fg = colors.common.base00,
    bg = colors.common.base00,
  },
  ["NvimTreeImageFile"] = {
    fg = colors.common.base15,
  },
  ["NvimTreeWindowPicker"] = {
    fg = colors.common.base09,
    bg = colors.common.base02,
    bold = true,
  },
}

-- vim:ft=lua
