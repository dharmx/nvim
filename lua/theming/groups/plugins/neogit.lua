local N = {}

function N.get(colors)
  return {
    ["NeogitBranch"] = { foreground = colors.common.base10 },
    ["NeogitRemote"] = { foreground = colors.common.base09 },
    ["NeogitHunkHeader"] = { foreground = colors.common.base08 },
    ["NeogitHunkHeaderHighlight"] = { foreground = colors.common.base08, background = colors.common.base02 },
    ["NeogitDiffContextHighlight"] = { background = colors.common.base01 },
    ["NeogitDiffDeleteHighlight"] = { foreground = colors.common.base11, decoration = "reverse" },
    ["NeogitDiffAddHighlight"] = { foreground = colors.common.base14, decoration = "reverse" },
  }
end

return N

-- vim:ft=lua
