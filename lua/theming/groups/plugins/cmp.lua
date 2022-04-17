local C = {}

function C.get(colors)
  return {
    ["CmpItemKindFunction"] = { guifg = colors.syntax.color09 },
    ["CmpItemKind"] = { guifg = colors.syntax.color17 },
    ["CmpItemKindSnippet"] = { guifg = colors.syntax.color01 },
    ["CmpItemKindFile"] = { guifg = colors.syntax.color06 },
    ["CmpItemKindFolder"] = { guifg = colors.syntax.color16 },
    ["CmpItemMenu"] = { guifg = colors.syntax.color04 },
    ["CmpItemAbbr"] = { guifg = colors.syntax.color09 },
    ["CmpItemAbbrMatchFuzzy"] = { guifg = colors.syntax.color00 },
    ["CmpItemAbbrMatch"] = { guifg = colors.syntax.color06 },
    ["CmpItemAbbrMatchDeprecated"] = { guifg = colors.syntax.color08 },
  }
end

return C

-- vim:ft=lua
