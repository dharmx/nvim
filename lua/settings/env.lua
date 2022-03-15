g = vim.g
o = vim.o

wo = vim.wo
bo = vim.bo

fn = vim.fn
api = vim.api
lsp = vim.lsp
env = vim.env

opt = vim.opt
opt_local = vim.opt_local

set_map = vim.keymap.set
rmv_map = vim.keymap.del

schedule = vim.schedule
schedule_wrap = vim.schedule_wrap
diagnostic = vim.diagnostic

cmd = api.nvim_command
buf = lsp.buf

stdpath = fn.stdpath
system = fn.system
inspect = vim.inspect

INSTALL_PATH = stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
COMPILE_PATH = stdpath "config" .. "/lua/_compiled.lua"

-- vim:ft=lua
