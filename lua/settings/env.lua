_G.g = vim.g
_G.o = vim.o

_G.wo = vim.wo
_G.bo = vim.bo

_G.fn = vim.fn
_G.api = vim.api
_G.lsp = vim.lsp
_G.env = vim.env

_G.opt = vim.opt
_G.opt_local = vim.opt_local

_G.set_map = vim.keymap.set
_G.rmv_map = vim.keymap.del

_G.schedule = vim.schedule
_G.schedule_wrap = vim.schedule_wrap
_G.diagnostic = vim.diagnostic
_G.stdpath = fn.stdpath

_G.cmd = api.nvim_command
_G.buf = lsp.buf

_G.system = fn.system
_G.inspect = vim.inspect

_G.INSTALL_PATH = stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
_G.COMPILE_PATH = stdpath "config" .. "/lua/_compiled.lua"

-- vim:ft=lua
