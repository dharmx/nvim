local N = {}

function N.get(colors)
  return {
    ["NvimTreeRootFolder"] = { foreground = colors.common.base11, decoration = "bold" },
    ["NvimTreeGitDirty"] = { foreground = colors.common.base15 },
    ["NvimTreeGitNew"] = { foreground = colors.common.base14 },
    ["NvimTreeImageFile"] = { foreground = colors.common.base13 },
    ["NvimTreeExecFile"] = { foreground = colors.common.base07 },
    ["NvimTreeSpecialFile"] = { foreground = colors.common.base12, decoration = "bold" },
    ["NvimTreeFolderName"] = { foreground = colors.common.base09 },
    ["NvimTreeDirectoryIcon"] = { foreground = colors.common.base09 },
    ["NvimTreeIndentMarker"] = { foreground = colors.shades.shade00 },
    ["NvimTreeNormal"] = { background = colors.shades.shade08 },
    ["NvimTreeRenamed"] = { foreground = colors.common.base07 },
  }
end

return N

-- vim:ft=lua
