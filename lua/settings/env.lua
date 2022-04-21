--- Aliases for vim dictionary keys.
-- @module settings.env

-- NOTE: Global aliases that will be used throughout this config.

g = vim.g -- global editor variables
o = vim.o -- get or set editor options
v = vim.v -- get or set variables

wo = vim.wo -- get or set window-scoped variables
bo = vim.bo -- get or set buffer-scoped variables
go = vim.go -- get or set global-scoped variables

t = vim.t -- tabpage-scoped variables
w = vim.w -- window-scoped variables
b = vim.b -- buffer-scoped variables

fn = vim.fn -- vim utility functions
api = vim.api -- neovim utility functions
lsp = vim.lsp -- lsp variables and functions
env = vim.env -- env variables defined in the editor session

opt = vim.opt -- returns an Option object
opt_local = vim.opt_local -- returns an Option object that is buffer scoped
opt_global = vim.opt_global -- returns an Option object that is global scoped

set_map = vim.keymap.set -- set a keymap
rmv_map = vim.keymap.del -- delete a keymap

schedule = vim.schedule -- defers callback until the Nvim API is safe to call
schedule_wrap = vim.schedule_wrap -- schedules to be invoked soon by the main event-loop
diagnostic = vim.diagnostic -- framework for displaying errors or warnings from external tools
stdpath = fn.stdpath -- Returns standard-path locations of various default files and directories

cmd = api.nvim_command --  executes an ex-command
exec = api.nvim_exec -- executes vimscript (multiline block of ex-commands)
lsb = lsp.buf -- buffer scoped lsp setting variables/functions

system = fn.system -- gets the output of cmd as a string/table returns a table
inspect = vim.inspect -- return a human-readable representation of the given object

PACKER_INSTALL_PATH = stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
PACKER_COMPILE_PATH = stdpath "config" .. "/lua/_compiled.lua"

-- append node binaries to path.
env.PATH = env.PATH .. ":./node_modules/.bin"

-- vim:ft=lua
