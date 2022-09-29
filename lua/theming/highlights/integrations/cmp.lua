local colors = require("utils.theming").get_active_theme()

return {
  ["CmpItemKindText"] = {
    fg = colors.syntax.color16,
  },
  ["CmpItemKindMethod"] = {
    fg = colors.syntax.color00,
  },
  ["CmpItemKindSnippet"] = {
    fg = colors.syntax.color03,
  },
  ["CmpItemKindFunction"] = {
    fg = colors.syntax.color01,
  },
  ["CmpItemKindConstructor"] = {
    fg = colors.syntax.color06,
  },
  ["CmpItemKindField"] = {
    fg = colors.syntax.color04,
  },
  ["CmpItemKindVariable"] = {
    fg = colors.syntax.color02,
  },
  ["CmpItemKindClass"] = {
    fg = colors.syntax.color01,
  },
  ["CmpItemKindInterface"] = {
    fg = colors.syntax.color13,
  },
  ["CmpItemKindModule"] = {
    fg = colors.syntax.color13,
  },
  ["CmpItemKindProperty"] = {
    fg = colors.syntax.color20,
  },
  ["CmpItemKindUnit"] = {
    fg = colors.syntax.color19,
  },
  ["CmpItemKindValue"] = {
    fg = colors.syntax.color08,
  },
  ["CmpItemKindEnum"] = {
    fg = colors.syntax.color06,
  },
  ["CmpItemKindKeyword"] = {
    fg = colors.syntax.color15,
  },
  ["CmpItemKindColor"] = {
    fg = colors.syntax.color17,
  },
  ["CmpItemKindFile"] = {
    fg = colors.syntax.color10,
  },
  ["CmpItemKindReference"] = {
    fg = colors.syntax.color10,
  },
  ["CmpItemKindFolder"] = {
    fg = colors.syntax.color17,
  },
  ["CmpItemKindEnumMember"] = {
    fg = colors.syntax.color20,
  },
  ["CmpItemKindConstant"] = {
    fg = colors.syntax.color19,
  },
  ["CmpItemKindStruct"] = {
    fg = colors.syntax.color00,
  },
  ["CmpItemKindEvent"] = {
    fg = colors.syntax.color00,
  },
  ["CmpItemKindOperator"] = {
    fg = colors.syntax.color0,
  },
  ["CmpItemKindTypeParameter"] = {
    fg = colors.syntax.color05,
  },
  ["CmpItemMenu"] = {
    fg = colors.syntax.color10,
  },
  ["CmpItemAbbr"] = {
    fg = colors.syntax.color15,
  },
  ["CmpItemAbbrMatchFuzzy"] = {
    fg = colors.syntax.color00,
  },
  ["CmpItemAbbrMatch"] = {
    fg = colors.syntax.color06,
  },
  ["CmpItemAbbrMatchDeprecated"] = {
    fg = colors.syntax.color08,
  },
}

-- vim:ft=lua
