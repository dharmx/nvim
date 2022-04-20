local C = {}

function C.get(colors)
  return {
    ["CmpItemKindText"] = { guifg = colors.syntax.color16, guibg = colors.kinds.Text },
    ["CmpItemKindMethod"] = { guifg = colors.syntax.color00, guibg = colors.kinds.Method },
    ["CmpItemKindSnippet"] = { guifg = colors.syntax.color03, guibg = colors.kinds.Snippet },
    ["CmpItemKindFunction"] = { guifg = colors.syntax.color01, guibg = colors.kinds.Function },
    ["CmpItemKindConstructor"] = { guifg = colors.syntax.color06, guibg = colors.kinds.Constructor },
    ["CmpItemKindField"] = { guifg = colors.syntax.color04, guibg = colors.kinds.Field },
    ["CmpItemKindVariable"] = { guifg = colors.syntax.color02, guibg = colors.kinds.Variable },
    ["CmpItemKindClass"] = { guifg = colors.syntax.color01, guibg = colors.kinds.Class },
    ["CmpItemKindInterface"] = { guifg = colors.syntax.color13, guibg = colors.kinds.Interface },
    ["CmpItemKindModule"] = { guifg = colors.syntax.color13, guibg = colors.kinds.Module },
    ["CmpItemKindProperty"] = { guifg = colors.syntax.color20, guibg = colors.kinds.Property },
    ["CmpItemKindUnit"] = { guifg = colors.syntax.color19, guibg = colors.kinds.Unit },
    ["CmpItemKindValue"] = { guifg = colors.syntax.color08, guibg = colors.kinds.Value },
    ["CmpItemKindEnum"] = { guifg = colors.syntax.color06, guibg = colors.kinds.Enum },
    ["CmpItemKindKeyword"] = { guifg = colors.syntax.color15, guibg = colors.kinds.Keyword },
    ["CmpItemKindColor"] = { guifg = colors.syntax.color17, guibg = colors.kinds.Color },
    ["CmpItemKindFile"] = { guifg = colors.syntax.color10, guibg = colors.kinds.File },
    ["CmpItemKindReference"] = { guifg = colors.syntax.color10, guibg = colors.kinds.Reference },
    ["CmpItemKindFolder"] = { guifg = colors.syntax.color17, guibg = colors.kinds.Folder },
    ["CmpItemKindEnumMember"] = { guifg = colors.syntax.color20, guibg = colors.kinds.EnumMember },
    ["CmpItemKindConstant"] = { guifg = colors.syntax.color19, guibg = colors.kinds.Constant },
    ["CmpItemKindStruct"] = { guifg = colors.syntax.color00, guibg = colors.kinds.Struct },
    ["CmpItemKindEvent"] = { guifg = colors.syntax.color00, guibg = colors.kinds.Event },
    ["CmpItemKindOperator"] = { guifg = colors.syntax.color0, guibg = colors.kinds.Operator },
    ["CmpItemKindTypeParameter"] = { guifg = colors.syntax.color05, guibg = colors.kinds.TypeParameter },
    ["CmpItemMenu"] = { guifg = colors.syntax.color10 },
    ["CmpItemAbbr"] = { guifg = colors.syntax.color15 },
    ["CmpItemAbbrMatchFuzzy"] = { guifg = colors.syntax.color00 },
    ["CmpItemAbbrMatch"] = { guifg = colors.syntax.color06 },
    ["CmpItemAbbrMatchDeprecated"] = { guifg = colors.syntax.color08 },
  }
end

return C

-- vim:ft=lua
