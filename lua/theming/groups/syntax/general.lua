local S = {}

function S.get(colors)
  return {
    Function = { guifg = colors.syntax.color09 },
    Type = { guifg = colors.syntax.color00 },
    StorageClass = { guifg = colors.syntax.color00 },
    Float = { guifg = colors.syntax.color01 },
    Number = { guifg = colors.syntax.color06 },
    Boolean = { guifg = colors.syntax.color03, gui = "bold" },
    String = { guifg = colors.syntax.color04 },
    Character = { guifg = colors.syntax.color05 },
    Constant = { guifg = colors.syntax.color00, gui = "bold" },
    Keyword = { guifg = colors.syntax.color16, gui = "bold" },
    Structure = { link = "Keyword" },
    Label = { guifg = colors.syntax.color00 },
    Operator = { guifg = colors.syntax.color02 },
    Exception = { guifg = colors.syntax.color08 },
    PreProc = { guifg = colors.syntax.color00 },
    Include = { guifg = colors.syntax.color02 },
    Macro = { guifg = colors.syntax.color09 },
    Typedef = { guifg = colors.syntax.color09 },
    PreCondit = { guifg = colors.syntax.color10 },
    Define = { guifg = colors.syntax.color09 },
    Special = { guifg = colors.syntax.color00, gui = "bold" },
    SpecialChar = { guifg = colors.syntax.color09 },
    SpecialComment = { guifg = colors.syntax.color11 },
    Comment = { guifg = colors.syntax.color14 },
    Tag = { guifg = colors.syntax.color16 },
    Delimiter = { guifg = colors.syntax.color16 },
    Debug = { guifg = colors.syntax.color17 },
    Underlined = { guifg = colors.syntax.color15, gui = "underline" },
    Ignore = { guifg = colors.syntax.color18 },
    Error = { guifg = colors.syntax.color17 },
    Todo = { guifg = colors.syntax.color10 },
    Conditional = { guifg = colors.syntax.color00 },
    Repeat = { guifg = colors.syntax.color03 },
    Conceal = { guifg = "NONE" },
    Statement = { guifg = colors.syntax.color00 },
    Identifier = { guifg = colors.syntax.color03 },
  }
end

return S

-- vim:ft=lua
