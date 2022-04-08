local C = {}

function C.get(colors)
  return {
    ["CmpItemKindFunction"] = { foreground = colors.syntax.color09 },
    ["CmpItemKind"] = { foreground = colors.syntax.color17 },
    ["CmpItemKindSnippet"] = { foreground = colors.syntax.color01 },
    ["CmpItemKindFile"] = { foreground = colors.syntax.color06 },
    ["CmpItemKindFolder"] = { foreground = colors.syntax.color16 },
    ["CmpItemMenu"] = { foreground = colors.syntax.color04 },
    ["CmpItemAbbr"] = { foreground = colors.syntax.color09 },
    ["CmpItemAbbrMatchFuzzy"] = { foreground = colors.syntax.color00 },
    ["CmpItemAbbrMatch"] = { foreground = colors.syntax.color06 },
    ["CmpItemAbbrMatchDeprecated"] = { foreground = colors.syntax.color08 },
  }
end

return C

-- vim:ft=lua
