local S = {}

function S.get(colors)
  return {
    Function = { foreground = colors.syntax.color09 },
    Type = { foreground = colors.syntax.color00 },
    StorageClass = { foreground = colors.syntax.color00 },
    Float = { foreground = colors.syntax.color01 },
    Number = { foreground = colors.syntax.color06 },
    Boolean = { foreground = colors.syntax.color03, decoration = "bold" },
    String = { foreground = colors.syntax.color04 },
    Character = { foreground = colors.syntax.color05 },
    Constant = { foreground = colors.syntax.color00, decoration = "bold" },
    Keyword = { foreground = colors.syntax.color16, decoration = "bold" },
    Structure = { link = "Keyword" },
    Label = { foreground = colors.syntax.color00 },
    Operator = { foreground = colors.syntax.color02 },
    Exception = { foreground = colors.syntax.color08 },
    PreProc = { foreground = colors.syntax.color00 },
    Include = { foreground = colors.syntax.color02 },
    Macro = { foreground = colors.syntax.color09 },
    Typedef = { foreground = colors.syntax.color09 },
    PreCondit = { foreground = colors.syntax.color10 },
    Define = { foreground = colors.syntax.color09 },
    Special = { foreground = colors.syntax.color00, decoration = "bold" },
    SpecialChar = { foreground = colors.syntax.color09 },
    SpecialComment = { foreground = colors.syntax.color11 },
    Comment = { foreground = colors.syntax.color14 },
    Tag = { foreground = colors.syntax.color16 },
    Delimiter = { foreground = colors.syntax.color16 },
    Debug = { foreground = colors.syntax.color17 },
    Underlined = { foreground = colors.syntax.color15, decoration = "underline" },
    Ignore = { foreground = colors.syntax.color18 },
    Error = { foreground = colors.syntax.color17 },
    Todo = { foreground = colors.syntax.color10 },
    Conditional = { foreground = colors.syntax.color00 },
    Repeat = { foreground = colors.syntax.color03 },
    Conceal = { foreground = "NONE" },
    Statement = { foreground = colors.syntax.color00 },
    Identifier = { foreground = colors.syntax.color03 },
  }
end

return S

-- vim:ft=lua
