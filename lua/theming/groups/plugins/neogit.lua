local N = {}

function N.get(theme)
  return {
    ["NeogitBranch"] = { foreground = theme.common.base10 },
    ["NeogitRemote"] = { foreground = theme.common.base09 },
    ["NeogitHunkHeader"] = { foreground = theme.common.base08 },
    ["NeogitHunkHeaderHighlight"] = { foreground = theme.common.base08, background = theme.common.base02 },
    ["NeogitDiffContextHighlight"] = { background = theme.common.base01 },
    ["NeogitDiffDeleteHighlight"] = { foreground = theme.common.base11, decoration = "reverse" },
    ["NeogitDiffAddHighlight"] = { foreground = theme.common.base14, decoration = "reverse" },
  }
end

return N

-- vim:ft=lua
