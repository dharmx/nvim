local ok, indentline = pcall(require, "indent_blankline")
if not ok then return end
local MainConfig = require("dharmx")

indentline.setup({
  context_highlight_list = nil,
  char_highlight_list = nil,
  space_char_highlight_list = nil,
  char = MainConfig.ui.blankline.char,
  context_char_list = MainConfig.ui.blankline.context_char_list,
  space_char_blankline = MainConfig.ui.blankline.space_char_blankline,
  filetype_exclude = MainConfig.black.filetype,
  buftype_exclude = MainConfig.black.buftype,
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  },
})

-- vim:filetype=lua
