local colors = require("utils.theming").get_active_theme()

return {
  ["Function"] = {
    fg = colors.syntax.color09,
    bold = true,
  },
  ["Method"] = {
    fg = colors.syntax.color01,
    bold = true,
  },
  ["Type"] = {
    fg = colors.syntax.color00,
  },
  ["StorageClass"] = {
    fg = colors.syntax.color00,
  },
  ["Float"] = {
    fg = colors.syntax.color01,
  },
  ["Number"] = {
    fg = colors.syntax.color06,
  },
  ["Boolean"] = {
    fg = colors.syntax.color03,
    bold = true,
  },
  ["String"] = {
    fg = colors.syntax.color15,
  },
  ["Character"] = {
    fg = colors.syntax.color05,
  },
  ["Constant"] = {
    fg = colors.syntax.color00,
    bold = true,
  },
  ["Keyword"] = {
    fg = colors.syntax.color16,
    bold = true,
  },
  ["Structure"] = {
    link = "Keyword",
  },
  ["Label"] = {
    fg = colors.syntax.color00,
  },
  ["Operator"] = {
    fg = colors.syntax.color19,
  },
  ["Exception"] = {
    fg = colors.syntax.color02,
  },
  ["PreProc"] = {
    fg = colors.syntax.color00,
  },
  ["Include"] = {
    fg = colors.syntax.color02,
  },
  ["Macro"] = {
    fg = colors.syntax.color09,
  },
  ["Typedef"] = {
    fg = colors.syntax.color09,
  },
  ["PreCondit"] = {
    fg = colors.syntax.color10,
  },
  ["Define"] = {
    fg = colors.syntax.color09,
  },
  ["Special"] = {
    fg = colors.syntax.color00,
    bold = true,
  },
  ["SpecialChar"] = {
    fg = colors.syntax.color09,
  },
  ["SpecialComment"] = {
    fg = colors.syntax.color11,
    bold = true,
  },
  ["Comment"] = {
    fg = colors.syntax.color14,
  },
  ["Tag"] = {
    fg = colors.syntax.color16,
  },
  ["Delimiter"] = {
    fg = colors.syntax.color16,
  },
  ["Debug"] = {
    fg = colors.syntax.color17,
  },
  ["Underlined"] = {
    fg = colors.syntax.color15,
    underline = true,
  },
  ["Ignore"] = {
    fg = colors.syntax.color18,
  },
  ["Error"] = {
    fg = colors.syntax.color17,
    underline = true,
  },
  ["Todo"] = {
    fg = colors.syntax.color10,
  },
  ["Conditional"] = {
    fg = colors.syntax.color00,
  },
  ["Repeat"] = {
    fg = colors.syntax.color03,
  },
  ["Conceal"] = {
    fg = "NONE",
  },
  ["Statement"] = {
    fg = colors.syntax.color00,
  },
  ["Identifier"] = {
    fg = colors.syntax.color04,
  },
}

-- vim:ft=lua
