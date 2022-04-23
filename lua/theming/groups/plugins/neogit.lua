return {
  setup = function(colors)
    hi("NeogitBranch", { guifg = colors.common.base10 })
    hi("NeogitRemote", { guifg = colors.common.base09 })
    hi("NeogitHunkHeader", { guifg = colors.common.base08 })
    hi("NeogitHunkHeaderHighlight", { guifg = colors.common.base08, guibg = colors.common.base02 })
    hi("NeogitDiffContextHighlight", { guibg = colors.common.base01 })
    hi("NeogitDiffDeleteHighlight", { guifg = colors.common.base11, gui = "reverse" })
    hi("NeogitDiffAddHighlight", { guifg = colors.common.base14, gui = "reverse" })
  end,
}

-- vim:ft=lua
