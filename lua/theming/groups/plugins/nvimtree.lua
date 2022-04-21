local N = {}

function N.get(colors)
  return {
    ["NvimTreeRootFolder"] = { guifg = colors.common.base11, gui = "bold" },
    ["NvimTreeGitDirty"] = { guifg = colors.common.base15 },
    ["NvimTreeGitNew"] = { guifg = colors.common.base14 },
    ["NvimTreeImageFile"] = { guifg = colors.common.base13 },
    ["NvimTreeExecFile"] = { guifg = colors.common.base07 },
    ["NvimTreeSpecialFile"] = { guifg = colors.common.base12, gui = "bold" },
    ["NvimTreeFolderName"] = { guifg = colors.common.base09 },
    ["NvimTreeEmptyFolderName"] = { guifg = colors.common.base02 },
    ["NvimTreeOpenedFolderName"] = { guifg = colors.common.base10 },
    ["NvimTreeFolderIcon"] = { guifg = colors.common.base09 },
    ["NvimTreeIndentMarker"] = { guifg = colors.shades.shade00 },
    ["NvimTreeNormal"] = { guibg = colors.shades.shade08 },
    ["NvimTreeRenamed"] = { guifg = colors.common.base07 },
  }
end

return N

-- vim:ft=lua
