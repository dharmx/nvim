local S = {}

function S.get(syntax)
  return {
    Function = { foreground = syntax.color09 },
    Type = { foreground = syntax.color00 },
    StorageClass = { foreground = syntax.color00 },
    Float = { foreground = syntax.color01 },
    Number = { foreground = syntax.color06 },
    Boolean = { foreground = syntax.color03, decoration = "bold" },
    String = { foreground = syntax.color04 },
    Character = { foreground = syntax.color05 },
    Constant = { foreground = syntax.color00, decoration = "bold" },
    Keyword = { foreground = syntax.color16, decoration = "bold" },
    Structure = { link = "Keyword" },
    Label = { foreground = syntax.color00 },
    Operator = { foreground = syntax.color02 },
    Exception = { foreground = syntax.color08 },
    PreProc = { foreground = syntax.color00 },
    Include = { foreground = syntax.color02 },
    Macro = { foreground = syntax.color09 },
    Typedef = { foreground = syntax.color09 },
    PreCondit = { foreground = syntax.color10 },
    Define = { foreground = syntax.color09 },
    Special = { foreground = syntax.color00, decoration = "bold" },
    SpecialChar = { foreground = syntax.color09 },
    SpecialComment = { foreground = syntax.color11 },
    Comment = { foreground = syntax.color14 },
    Tag = { foreground = syntax.color16 },
    Delimiter = { foreground = syntax.color16 },
    Debug = { foreground = syntax.color17 },
    Underlined = { foreground = syntax.color15, decoration = "underline" },
    Ignore = { foreground = syntax.color18 },
    Error = { foreground = syntax.color17 },
    Todo = { foreground = syntax.color10 },
    Conditional = { foreground = syntax.color00 },
    Repeat = { foreground = syntax.color03 },
    Conceal = { foreground = "NONE" },
    Statement = { foreground = syntax.color00 },
    Identifier = { foreground = syntax.color03 },
  }
end

return S

-- vim:ft=lua
