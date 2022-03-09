-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#5171ac gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#5e81ac gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#81a1c1 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#88c0d0 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#8fbcbb gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#9fd1c9 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent7 guifg=#88c0d0 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent8 guifg=#80afcb gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent9 guifg=#7ea0c0 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#3b4252 gui=nocombine]]

local present, blankline = pcall(require, "indent_blankline")

if not present then
  return
end

local config = {
  space_char_blankline = " ",
  char_highlight_list = {
    -- "IndentBlanklineIndent1",
    -- "IndentBlanklineIndent2",
    -- "IndentBlanklineIndent3",
    -- "IndentBlanklineIndent4",
    -- "IndentBlanklineIndent5",
    -- "IndentBlanklineIndent6",
    -- "IndentBlanklineIndent7",
    -- "IndentBlanklineIndent8",
    -- "IndentBlanklineIndent9",
    "IndentBlanklineIndent1",
  },
  show_current_context = true,
  show_current_context_start = true,
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
}

blankline.setup(config)

-- vim:ft=lua
