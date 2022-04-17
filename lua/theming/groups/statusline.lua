local D = {}

function D.get(colors)
  return {
    ["StatusLineBulbON"] = {
      guifg = colors.common.base13,
      guibg = colors.common.base01,
      gui = "bold",
    },
    ["StatusLineBulbOFF"] = {
      guifg = colors.common.base11,
      guibg = colors.common.base01,
      gui = "bold",
    },
    ["StatusLineBulbLOAD"] = {
      guifg = colors.common.base15,
      guibg = colors.common.base01,
      gui = "bold",
    },
    ["StatusLineDirname"] = {
      guifg = colors.common.base15,
      guibg = colors.common.base02,
      gui = "bold",
    },
    ["StatusLineDirnameReverse"] = {
      guifg = colors.common.base02,
      guibg = colors.common.base01,
    },
    ["StatusLineFilenameExtra"] = {
      guifg = colors.common.base15,
      guibg = colors.common.base02,
    },
    ["StatusLineFilenameExtraRight"] = {
      guifg = colors.common.base15,
      guibg = colors.common.base01,
    },
    ["StatusLinePositionLastExtra"] = {
      guifg = colors.common.base01,
      guibg = colors.common.base15,
    },
    ["StatusLineLSPDone"] = {
      guifg = colors.common.base14,
      guibg = colors.common.base01,
    },
    ["StatusLineLSPClients"] = {
      guibg = colors.common.base01,
      guifg = colors.common.base13,
    },
    ["StatusLineLSPExtra"] = {
      guifg = colors.common.base03,
      guibg = colors.common.base01,
    },
    ["StatusLineLSPExtraExtra"] = {
      guifg = colors.common.base03,
      guibg = colors.shades.shade06,
    },
    ["StatusLineLSPDark"] = {
      guifg = colors.syntax.color08,
      guibg = colors.common.base01,
    },
    ["StatusLineLSPReverse"] = {
      guibg = colors.shades.shade06,
      guifg = colors.common.base01,
    },
    ["StatusLineGitBranch"] = {
      guifg = colors.common.base12,
      guibg = colors.common.base02,
    },
    ["StatusLineGitAdd"] = {
      guifg = colors.common.base14,
      guibg = colors.common.base02,
    },
    ["StatusLineGitDelete"] = {
      guifg = colors.common.base11,
      guibg = colors.common.base02,
    },
    ["StatusLineGitChange"] = {
      guifg = colors.common.base15,
      guibg = colors.common.base02,
    },
    ["StatusLineGit"] = {
      guibg = colors.common.base02,
    },
    ["StatusLineGitExtra"] = {
      guibg = colors.common.base01,
      guifg = colors.common.base02,
    },
    ["StatusLineGitExtraExtra"] = {
      guibg = colors.shades.shade06,
      guifg = colors.common.base02,
    },
    ["StatusLineError"] = {
      guibg = colors.shades.shade06,
      guifg = colors.common.base11,
    },
    ["StatusLineWarn"] = {
      guibg = colors.shades.shade06,
      guifg = colors.common.base12,
    },
    ["StatusLineHint"] = {
      guibg = colors.shades.shade06,
      guifg = colors.common.base09,
    },
    ["StatusLineInfo"] = {
      guibg = colors.shades.shade06,
      guifg = colors.common.base13,
    },
    ["StatusLineScopesReverse"] = {
      guifg = colors.shades.shade06,
      guibg = colors.shades.shade06,
    },
    ["StatusLineScopesOFF"] = {
      guibg = colors.shades.shade06,
      guifg = colors.common.base11,
      gui = "bold",
    },
    ["StatusLineScopesON"] = {
      guibg = colors.shades.shade06,
      guifg = colors.common.base14,
      gui = "bold",
    },
    ["StatusLineScopes"] = {
      guifg = colors.common.base12,
      guibg = colors.shades.shade06,
    },
    ["Statusline"] = {
      guibg = colors.shades.shade06,
      guifg = colors.shades.shade06,
    },
    ["StatuslineNC"] = {
      guibg = colors.common.base00,
      guifg = colors.shades.shade01,
    },
  }
end

return D

-- vim:ft=lua
