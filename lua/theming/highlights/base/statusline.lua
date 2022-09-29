local colors = require("utils.theming").get_active_theme()

return {
  ["StatusLine"] = {
    bg = colors.common.base00,
    fg = colors.common.base00,
  },
  ["StatusLineDirnameReverse"] = {
    fg = colors.common.base02,
    bg = colors.common.base01,
  },
  ["StatusLineFilenameExtra"] = {
    fg = colors.common.base15,
    bg = colors.common.base02,
  },
  ["StatusLineFilenameExtraRight"] = {
    fg = colors.common.base15,
    bg = colors.common.base01,
  },
  ["StatusLinePositionLastExtra"] = {
    fg = colors.common.base01,
    bg = colors.common.base15,
  },
  ["StatusLineLSPDone"] = {
    fg = colors.common.base14,
    bg = colors.common.base01,
  },
  ["StatusLineLSPClients"] = {
    bg = colors.common.base01,
    fg = colors.common.base13,
  },
  ["StatusLineLSPExtra"] = {
    fg = colors.common.base03,
    bg = colors.common.base01,
  },
  ["StatusLineLSPExtraExtra"] = {
    fg = colors.common.base03,
    bg = colors.shades.shade06,
  },
  ["StatusLineLSPDark"] = {
    fg = colors.syntax.color08,
    bg = colors.common.base01,
  },
  ["StatusLineLSPReverse"] = {
    bg = colors.shades.shade06,
    fg = colors.common.base01,
  },
  ["StatusLineGitBranch"] = {
    fg = colors.common.base12,
    bg = colors.common.base02,
    bold = true,
  },
  ["StatusLineGitAdd"] = {
    fg = colors.common.base14,
    bg = colors.common.base02,
    bold = true,
  },
  ["StatusLineGitDelete"] = {
    fg = colors.common.base11,
    bg = colors.common.base02,
  },
  ["StatusLineGitChange"] = {
    fg = colors.common.base15,
    bg = colors.common.base02,
  },
  ["StatusLineGit"] = {
    bg = colors.common.base02,
  },
  ["StatusLineGitExtra"] = {
    bg = colors.common.base01,
    fg = colors.common.base02,
  },
  ["StatusLineGitExtraExtra"] = {
    bg = colors.shades.shade06,
    fg = colors.common.base02,
  },
  ["StatusLineNC"] = {
    bg = colors.common.base00,
    fg = colors.shades.shade01,
  },
  ["StatusLineBulbON"] = {
    fg = colors.common.base13,
    bg = colors.common.base01,
    bold = true,
  },
  ["StatusLineBulbOFF"] = {
    fg = colors.common.base11,
    bg = colors.common.base01,
    bold = true,
  },
  ["StatusLineBulbLOAD"] = {
    fg = colors.common.base15,
    bg = colors.common.base01,
    bold = true,
  },
  ["StatusLineDirname"] = {
    fg = colors.common.base15,
    bg = colors.common.base02,
    bold = true,
  },
}

-- vim:ft=lua
