local colors = require("utils.theming").get_active_theme()

return {
  ["MatchParen"] = {
    fg = colors.common.base08,
    bg = colors.shades.shade03,
    bold = true,
  },
  ["Normal"] = {
    bg = colors.common.base00,
  },
  ["NormalFloat"] = {
    fg = colors.common.base11,
    bg = colors.shades.shade11,
  },
  ["cheatSeparator"] = {
    fg = colors.common.base02,
  },
  ["FloatBorder"] = {
    bg = colors.shades.shade11,
    fg = colors.shades.shade11,
  },
  ["ColorColumn"] = {
    bg = colors.common.base01,
  },
  ["Conceal"] = {
    fg = colors.common.base01,
  },
  ["Directory"] = {
    fg = colors.common.base07,
  },
  ["DiffAdd"] = {
    fg = colors.common.base14,
    reverse = true,
  },
  ["DiffChange"] = {
    fg = colors.common.base13,
    reverse = true,
  },
  ["DiffDelete"] = {
    fg = colors.common.base11,
    reverse = true,
  },
  ["DiffText"] = {
    fg = colors.common.base15,
    reverse = true,
  },
  ["EndOfBuffer"] = {
    fg = colors.common.base01,
  },
  ["ErrorMsg"] = {
    fg = colors.common.base11,
    undercurl = true,
  },
  ["Folded"] = {
    fg = colors.common.base03,
  },
  ["FoldColumn"] = {
    fg = colors.common.base07,
  },
  ["IncSearch"] = {
    fg = colors.common.base13,
    bg = colors.common.base02,
  },
  ["LineNr"] = {
    fg = colors.shades.shade01,
    bold = true,
  },
  ["LineNrAbove"] = {
    fg = colors.common.base13,
    bold = true,
  },
  ["LineNrBelow"] = {
    fg = colors.common.base15,
    bold = true,
  },
  ["SignColumn"] = {
    link = "Normal",
  },
  ["VertSplit"] = {
    fg = colors.shades.shade03,
  },
  ["WinSeparator"] = {
    fg = colors.shades.shade03,
  },
  ["CursorLineNr"] = {
    fg = colors.common.base08,
    bold = true,
  },
  ["CursorLine"] = {
    bg = "NONE",
  },
  ["ModeMsg"] = {
    fg = colors.common.base14,
    bold = true,
  },
  ["MsgArea"] = {
    fg = colors.common.base09,
    bold = true,
  },
  ["MsgSeparator"] = {
    fg = colors.common.base15,
    bold = true,
  },
  ["MoreMsg"] = {
    fg = colors.common.base09,
  },
  ["NonText"] = {
    fg = colors.shades.shade03,
  },
  ["PmenuSel"] = {
    bg = colors.common.base14,
    fg = colors.common.base02,
    bold = true,
  },
  ["PmenuSbar"] = {
    bg = colors.shades.shade05,
    fg = colors.shades.shade05,
  },
  ["PmenuThumb"] = {
    bg = colors.common.base02,
    fg = colors.common.base02,
  },
  ["Pmenu"] = {
    bg = colors.shades.shade12,
    fg = colors.common.base04,
  },
  ["Question"] = {
    fg = colors.common.base14,
  },
  ["QuickFixLine"] = {
    fg = colors.common.base04,
    reverse = true,
  },
  ["qfLineNr"] = {
    fg = colors.common.base04,
    reverse = true,
  },
  ["Search"] = {
    fg = colors.common.base10,
    bg = colors.common.base06,
    reverse = true,
  },
  ["SpecialKey"] = {
    fg = colors.common.base09,
  },
  ["SpellBad"] = {
    fg = colors.common.base11,
    undercurl = true,
  },
  ["SpellCap"] = {
    fg = colors.common.base07,
    undercurl = true,
  },
  ["SpellLocal"] = {
    fg = colors.common.base08,
  },
  ["SpellRare"] = {
    fg = colors.common.base09,
  },
  ["TabLineFill"] = {
    fg = colors.common.base04,
  },
  ["TablineSel"] = {
    fg = colors.common.base01,
    bg = colors.common.base09,
  },
  ["Tabline"] = {
    fg = colors.common.base04,
    bg = colors.common.base01,
  },
  ["Title"] = {
    fg = colors.common.base14,
    bold = true,
  },
  ["Visual"] = { bg = colors.shades.shade05 },
  ["VisualNC"] = {
    bg = colors.common.base11,
    fg = colors.common.base13,
  },
  ["VisualNOS"] = {
    bg = colors.shades.shade05,
    fg = colors.common.base13,
  },
  ["WarningMsg"] = {
    fg = colors.common.base15,
    underline = true,
  },
  ["WildMenu"] = {
    fg = colors.common.base12,
    bold = true,
  },
  ["CursorColumn"] = {
    bg = colors.common.base01,
  },
  ["ToolbarLine"] = {
    fg = colors.common.base04,
    bg = colors.common.base01,
  },
  ["ToolbarButton"] = {
    fg = colors.common.base04,
    bold = true,
  },
  ["NormalMode"] = {
    fg = colors.common.base04,
    reverse = true,
  },
  ["InsertMode"] = {
    fg = colors.common.base14,
    reverse = true,
  },
  ["ReplacelMode"] = {
    fg = colors.common.base11,
    reverse = true,
  },
  ["VisualMode"] = {
    fg = colors.common.base09,
    reverse = true,
  },
  ["CommandMode"] = {
    fg = colors.common.base04,
    reverse = true,
  },
  ["Warnings"] = {
    fg = colors.common.base15,
  },
  ["healthError"] = {
    fg = colors.common.base11,
  },
  ["healthSuccess"] = {
    fg = colors.common.base14,
  },
  ["healthWarning"] = {
    fg = colors.common.base15,
  },
}

-- vim:ft=lua
