opt = vim.opt
opt_local = vim.opt_local

g = vim.g
o = vim.o
wo = vim.wo
env = vim.env

cmd = vim.api.nvim_command
fn = vim.fn
stdpath = fn.stdpath
system = fn.system
api = vim.api
lsp = vim.lsp

hi = require("theming.utils.helpers").highlight
utils = require "utils"
alias = utils.alias
augroup = utils.augroup
autocmd = utils.autocmd

cmd "colorscheme nordic"
colors = require("theming.utils.helpers").get_active_scheme()

-- vim:ft=lua
