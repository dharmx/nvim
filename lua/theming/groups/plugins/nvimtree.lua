local N = {}

function N.get(theme)
  return {
    ["NvimTreeRootFolder"] = { foreground = theme.common.base11, decoration = "bold" },
    ["NvimTreeGitDirty"] = { foreground = theme.common.base15 },
    ["NvimTreeGitNew"] = { foreground = theme.common.base14 },
    ["NvimTreeImageFile"] = { foreground = theme.common.base13 },
    ["NvimTreeExecFile"] = { foreground = theme.common.base07 },
    ["NvimTreeSpecialFile"] = { foreground = theme.common.base12, decoration = "bold" },
    ["NvimTreeFolderName"] = { foreground = theme.common.base09 },
    ["NvimTreeEmptyFolderName"] = { foreground = theme.common.base02 },
    ["NvimTreeOpenedFolderName"] = { foreground = theme.common.base10 },
    ["NvimTreeFolderIcon"] = { foreground = theme.common.base09 },
    ["NvimTreeIndentMarker"] = { foreground = theme.shades.shade03 },
    ["NvimTreeNormal"] = { background = theme.shades.shade08 },
    ["NvimTreeRenamed"] = { foreground = theme.common.base07 },
  }
end

return N

-- vim:ft=lua
