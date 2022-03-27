local S = {}

function S.get(theme)
  return {
    Function = { foreground = theme.syntax.color09 },
    Type = { foreground = theme.syntax.color00 },
    StorageClass = { foreground = theme.syntax.color00 },
    Float = { foreground = theme.syntax.color01 },
    Number = { foreground = theme.syntax.color06 },
    Boolean = { foreground = theme.syntax.color03, decoration = "bold" },
    String = { foreground = theme.syntax.color04 },
    Character = { foreground = theme.syntax.color05 },
    Constant = { foreground = theme.syntax.color00, decoration = "bold" },
    Keyword = { foreground = theme.syntax.color16, decoration = "bold" },
    Structure = { link = "Keyword" },
    Label = { foreground = theme.syntax.color00 },
    Operator = { foreground = theme.syntax.color02 },
    Exception = { foreground = theme.syntax.color08 },
    PreProc = { foreground = theme.syntax.color00 },
    Include = { foreground = theme.syntax.color02 },
    Macro = { foreground = theme.syntax.color09 },
    Typedef = { foreground = theme.syntax.color09 },
    PreCondit = { foreground = theme.syntax.color10 },
    Define = { foreground = theme.syntax.color09 },
    Special = { foreground = theme.syntax.color00, decoration = "bold" },
    SpecialChar = { foreground = theme.syntax.color09 },
    SpecialComment = { foreground = theme.syntax.color11 },
    Comment = { foreground = theme.syntax.color14 },
    Tag = { foreground = theme.syntax.color16 },
    Delimiter = { foreground = theme.syntax.color16 },
    Debug = { foreground = theme.syntax.color17 },
    Underlined = { foreground = theme.syntax.color15, decoration = "underline" },
    Ignore = { foreground = theme.syntax.color18 },
    Error = { foreground = theme.syntax.color17 },
    Todo = { foreground = theme.syntax.color10 },
    Conditional = { foreground = theme.syntax.color00 },
    Repeat = { foreground = theme.syntax.color03 },
    Conceal = { foreground = "NONE" },
    Statement = { foreground = theme.syntax.color00 },
    Identifier = { foreground = theme.syntax.color03 },
  }
end

return S

-- vim:ft=lua
