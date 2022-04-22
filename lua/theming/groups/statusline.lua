return {
  setup = function(colors)
    hi("StatusLineDirnameReverse", { guifg = colors.common.base02, guibg = colors.common.base01 })
    hi("StatusLineFilenameExtra", { guifg = colors.common.base15, guibg = colors.common.base02 })
    hi("StatusLineFilenameExtraRight", { guifg = colors.common.base15, guibg = colors.common.base01 })
    hi("StatusLinePositionLastExtra", { guifg = colors.common.base01, guibg = colors.common.base15 })
    hi("StatusLineLSPDone", { guifg = colors.common.base14, guibg = colors.common.base01 })
    hi("StatusLineLSPClients", { guibg = colors.common.base01, guifg = colors.common.base13 })
    hi("StatusLineLSPExtra", { guifg = colors.common.base03, guibg = colors.common.base01 })
    hi("StatusLineLSPExtraExtra", { guifg = colors.common.base03, guibg = colors.shades.shade06 })
    hi("StatusLineLSPDark", { guifg = colors.syntax.color08, guibg = colors.common.base01 })
    hi("StatusLineLSPReverse", { guibg = colors.shades.shade06, guifg = colors.common.base01 })
    hi("StatusLineGitBranch", { guifg = colors.common.base12, guibg = colors.common.base02, gui = "italic,bold" })
    hi("StatusLineGitAdd", { guifg = colors.common.base14, guibg = colors.common.base02, gui = "bold" })
    hi("StatusLineGitDelete", { guifg = colors.common.base11, guibg = colors.common.base02 })
    hi("StatusLineGitChange", { guifg = colors.common.base15, guibg = colors.common.base02 })
    hi("StatusLineGit", { guibg = colors.common.base02 })
    hi("StatusLineGitExtra", { guibg = colors.common.base01, guifg = colors.common.base02 })
    hi("StatusLineGitExtraExtra", { guibg = colors.shades.shade06, guifg = colors.common.base02 })
    hi("StatusLineError", { guibg = colors.shades.shade06, guifg = colors.common.base11 })
    hi("StatusLineWarn", { guibg = colors.shades.shade06, guifg = colors.common.base12 })
    hi("StatusLineHint", { guibg = colors.shades.shade06, guifg = colors.common.base09 })
    hi("StatusLineInfo", { guibg = colors.shades.shade06, guifg = colors.common.base13 })
    hi("StatusLineScopesReverse", { guifg = colors.shades.shade06, guibg = colors.shades.shade06 })
    hi("StatusLineScopes", { guifg = colors.common.base12, guibg = colors.shades.shade06 })
    hi("Statusline", { guibg = colors.shades.shade06, guifg = colors.shades.shade06 })
    hi("StatuslineNC", { guibg = colors.common.base00, guifg = colors.shades.shade01 })

    hi("StatusLineScopesOFF", {
      guibg = colors.shades.shade06,
      guifg = colors.common.base11,
      gui = "bold",
    })
    hi("StatusLineScopesON", {
      guibg = colors.shades.shade06,
      guifg = colors.common.base14,
      gui = "bold",
    })
    hi("StatusLineBulbON", {
      guifg = colors.common.base13,
      guibg = colors.common.base01,
      gui = "bold",
    })
    hi("StatusLineBulbOFF", {
      guifg = colors.common.base11,
      guibg = colors.common.base01,
      gui = "bold",
    })
    hi("StatusLineBulbLOAD", {
      guifg = colors.common.base15,
      guibg = colors.common.base01,
      gui = "bold",
    })
    hi("StatusLineDirname", {
      guifg = colors.common.base15,
      guibg = colors.common.base02,
      gui = "bold,italic",
    })
  end,
}

-- vim:ft=lua
