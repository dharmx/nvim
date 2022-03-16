local C = {}

function C.get(syntax)
  return {
    ["CmpItemKindFunction"] = { foreground = syntax.color09 },
    ["CmpItemKind"] = { foreground = syntax.color17 },
    ["CmpItemKindSnippet"] = { foreground = syntax.color01 },
    ["CmpItemKindFile"] = { foreground = syntax.color06 },
    ["CmpItemKindFolder"] = { foreground = syntax.color16 },
    ["CmpItemMenu"] = { foreground = syntax.color04 },
    ["CmpItemAbbr"] = { foreground = syntax.color09 },
    ["CmpItemAbbrMatchFuzzy"] = { foreground = syntax.color00 },
    ["CmpItemAbbrMatch"] = { foreground = syntax.color06 },
    ["CmpItemAbbrMatchDeprecated"] = { foreground = syntax.color08 },
  }
end

return C

-- vim:ft=lua
