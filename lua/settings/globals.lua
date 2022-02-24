local g = vim.g

g.mapleader = " "
g.did_load_filetypes = 1

g.markdown_fenced_languages = {
  "lua",
  "vim",
  "json",
  "typescript",
  "javascript",
  "js=javascript",
  "ts=typescript",
  "shell=sh",
  "python",
  "sh",
  "console=sh",
}

g.python3_host_prog = "python3"

vim.api.nvim_command "colorscheme nordic"
vim.o.background = "dark"
