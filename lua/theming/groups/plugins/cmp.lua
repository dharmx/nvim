local C = {}

function C.get(syntax)
  return {
    ["CmpItemKindFunction"] = { foreground = syntax.color09 },
    ["CmpItemKind"] = { foreground = syntax.color17, decoration = "bold" },
    ["CmpItemKindSnippet"] = { foreground = syntax.color01, decoration = "bold" },
    ["CmpItemKindFile"] = { foreground = syntax.color06, decoration = "bold" },
    ["CmpItemKindFolder"] = { foreground = syntax.color16, decoration = "bold" },
    ["CmpItemMenu"] = { foreground = syntax.color04 },
    ["CmpItemAbbr"] = { foreground = syntax.color09 },
    ["CmpItemAbbrMatchFuzzy"] = { foreground = syntax.color00 },
    ["CmpItemAbbrMatch"] = { foreground = syntax.color06, decoration = "bold" },
    ["CmpItemAbbrMatchDeprecated"] = { foreground = syntax.color08 },
  }
end

return C
