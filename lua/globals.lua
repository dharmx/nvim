fn = vim.fn
stdpath = fn.stdpath

install_path = stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
compile_path = stdpath "config" .. "/lua/_compiled.lua"

opt = vim.opt
opt_local = vim.opt_local

g = vim.g
o = vim.o
wo = vim.wo
bo = vim.bo
env = vim.env

schedule = vim.schedule
schedule_wrap = vim.schedule_wrap

cmd = vim.api.nvim_command
system = fn.system
api = vim.api
lsp = vim.lsp

hi = require("utils").highlight
utils = require "utils"

alias = utils.alias
abbrev = utils.abbrev
augroup = utils.augroup
autocmd = utils.autocmd

imap = utils.imap
vmap = utils.vmap
nmap = utils.nmap

excallback = utils.excallback
exists = utils.exists
notify = utils.notify

cmd "colorscheme nordic"
colors = require("utils").get_active_scheme()

-- vim:ft=lua
