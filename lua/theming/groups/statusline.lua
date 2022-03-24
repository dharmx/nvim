local D = {}

function D.get(theme)
  return {
    ["StatusLineBulbON"] = {
      foreground = theme.common.base13,
      background = theme.common.base01,
      decoration = "bold",
    },
    ["StatusLineBulbOFF"] = {
      foreground = theme.common.base11,
      background = theme.common.base01,
      decoration = "bold",
    },
    ["StatusLineBulbLOAD"] = {
      foreground = theme.common.base15,
      background = theme.common.base01,
      decoration = "bold",
    },
    ["StatusLineDirname"] = {
      foreground = theme.common.base15,
      background = theme.common.base02,
      decoration = "bold",
    },
    ["StatusLineDirnameReverse"] = {
      foreground = theme.common.base02,
      background = theme.common.base01,
    },
    ["StatusLineFilenameExtra"] = {
      foreground = theme.common.base15,
      background = theme.common.base02,
    },
    ["StatusLineFilenameExtraRight"] = {
      foreground = theme.common.base15,
      background = theme.common.base01,
    },
    ["StatusLinePositionLastExtra"] = {
      foreground = theme.common.base01,
      background = theme.common.base15,
    },
    ["StatusLineLSPDone"] = {
      foreground = theme.common.base14,
      background = theme.common.base01,
    },
    ["StatusLineLSPClients"] = {
      background = theme.common.base01,
      foreground = theme.common.base13,
    },
    ["StatusLineLSPExtra"] = {
      foreground = theme.common.base03,
      background = theme.common.base01,
    },
    ["StatusLineLSPExtraExtra"] = {
      foreground = theme.common.base03,
      background = theme.shades.shade06,
    },
    ["StatusLineLSPDark"] = {
      foreground = theme.syntax.color08,
      background = theme.common.base01,
    },
    ["StatusLineLSPReverse"] = {
      background = theme.shades.shade06,
      foreground = theme.common.base01,
    },
    ["StatusLineGitBranch"] = {
      foreground = theme.common.base12,
      background = theme.common.base02,
    },
    ["StatusLineGitAdd"] = {
      foreground = theme.common.base14,
      background = theme.common.base02,
    },
    ["StatusLineGitDelete"] = {
      foreground = theme.common.base11,
      background = theme.common.base02,
    },
    ["StatusLineGitChange"] = {
      foreground = theme.common.base15,
      background = theme.common.base02,
    },
    ["StatusLineGit"] = {
      background = theme.common.base02,
    },
    ["StatusLineGitExtra"] = {
      background = theme.common.base01,
      foreground = theme.common.base02,
    },
    ["StatusLineGitExtraExtra"] = {
      background = theme.shades.shade06,
      foreground = theme.common.base02,
    },
    ["StatusLineError"] = {
      background = theme.shades.shade06,
      foreground = theme.common.base11,
    },
    ["StatusLineWarn"] = {
      background = theme.shades.shade06,
      foreground = theme.common.base12,
    },
    ["StatusLineHint"] = {
      background = theme.shades.shade06,
      foreground = theme.common.base09,
    },
    ["StatusLineInfo"] = {
      background = theme.shades.shade06,
      foreground = theme.common.base13,
    },
    ["StatusLineScopesReverse"] = {
      foreground = theme.shades.shade06,
      background = theme.shades.shade06,
    },
    ["StatusLineScopesOFF"] = {
      background = theme.shades.shade06,
      foreground = theme.common.base11,
      decoration = "bold",
    },
    ["StatusLineScopesON"] = {
      background = theme.shades.shade06,
      foreground = theme.common.base14,
      decoration = "bold",
    },
    ["StatusLineScopes"] = {
      foreground = theme.common.base12,
      background = theme.shades.shade06,
    },
    ["Statusline"] = {
      background = theme.shades.shade06,
      foreground = theme.common.base04,
    },
    ["StatuslineNC"] = {
      background = theme.common.base00,
      foreground = theme.shades.shade01,
    },
  }
end

return D

-- vim:ft=lua
