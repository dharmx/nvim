local D = {}

function D.get(colors)
  return {
    ["StatusLineBulbON"] = {
      foreground = colors.common.base13,
      background = colors.common.base01,
      decoration = "bold",
    },
    ["StatusLineBulbOFF"] = {
      foreground = colors.common.base11,
      background = colors.common.base01,
      decoration = "bold",
    },
    ["StatusLineBulbLOAD"] = {
      foreground = colors.common.base15,
      background = colors.common.base01,
      decoration = "bold",
    },
    ["StatusLineDirname"] = {
      foreground = colors.common.base15,
      background = colors.common.base02,
      decoration = "bold",
    },
    ["StatusLineDirnameReverse"] = {
      foreground = colors.common.base02,
      background = colors.common.base01,
    },
    ["StatusLineFilenameExtra"] = {
      foreground = colors.common.base15,
      background = colors.common.base02,
    },
    ["StatusLineFilenameExtraRight"] = {
      foreground = colors.common.base15,
      background = colors.common.base01,
    },
    ["StatusLinePositionLastExtra"] = {
      foreground = colors.common.base01,
      background = colors.common.base15,
    },
    ["StatusLineLSPDone"] = {
      foreground = colors.common.base14,
      background = colors.common.base01,
    },
    ["StatusLineLSPClients"] = {
      background = colors.common.base01,
      foreground = colors.common.base13,
    },
    ["StatusLineLSPExtra"] = {
      foreground = colors.common.base03,
      background = colors.common.base01,
    },
    ["StatusLineLSPExtraExtra"] = {
      foreground = colors.common.base03,
      background = colors.shades.shade06,
    },
    ["StatusLineLSPDark"] = {
      foreground = colors.syntax.color08,
      background = colors.common.base01,
    },
    ["StatusLineLSPReverse"] = {
      background = colors.shades.shade06,
      foreground = colors.common.base01,
    },
    ["StatusLineGitBranch"] = {
      foreground = colors.common.base12,
      background = colors.common.base02,
    },
    ["StatusLineGitAdd"] = {
      foreground = colors.common.base14,
      background = colors.common.base02,
    },
    ["StatusLineGitDelete"] = {
      foreground = colors.common.base11,
      background = colors.common.base02,
    },
    ["StatusLineGitChange"] = {
      foreground = colors.common.base15,
      background = colors.common.base02,
    },
    ["StatusLineGit"] = {
      background = colors.common.base02,
    },
    ["StatusLineGitExtra"] = {
      background = colors.common.base01,
      foreground = colors.common.base02,
    },
    ["StatusLineGitExtraExtra"] = {
      background = colors.shades.shade06,
      foreground = colors.common.base02,
    },
    ["StatusLineError"] = {
      background = colors.shades.shade06,
      foreground = colors.common.base11,
    },
    ["StatusLineWarn"] = {
      background = colors.shades.shade06,
      foreground = colors.common.base12,
    },
    ["StatusLineHint"] = {
      background = colors.shades.shade06,
      foreground = colors.common.base09,
    },
    ["StatusLineInfo"] = {
      background = colors.shades.shade06,
      foreground = colors.common.base13,
    },
    ["StatusLineScopesReverse"] = {
      foreground = colors.shades.shade06,
      background = colors.shades.shade06,
    },
    ["StatusLineScopesOFF"] = {
      background = colors.shades.shade06,
      foreground = colors.common.base11,
      decoration = "bold",
    },
    ["StatusLineScopesON"] = {
      background = colors.shades.shade06,
      foreground = colors.common.base14,
      decoration = "bold",
    },
    ["StatusLineScopes"] = {
      foreground = colors.common.base12,
      background = colors.shades.shade06,
    },
    ["Statusline"] = {
      background = colors.shades.shade06,
      foreground = colors.common.base04,
    },
    ["StatuslineNC"] = {
      background = colors.common.base00,
      foreground = colors.shades.shade01,
    },
  }
end

return D

-- vim:ft=lua
