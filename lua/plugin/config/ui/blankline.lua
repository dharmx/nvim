local present, blankline = pcall(require, "indent_blankline")

if not present then
  return
end

local config = {
  char = "│",
  context_char_list = {
    "┃",
  },
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "markdown",
    "mason",
    "text",
    "",
  },
  space_char_blankline = " ",
  buftype_exclude = { "terminal", "nofile" },
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
  context_highlight_list = nil,
  char_highlight_list = nil,
  space_char_highlight_list = nil
}

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
-- vim.wo.colorcolumn = "99999"

blankline.setup(config)

-- vim:ft=lua
