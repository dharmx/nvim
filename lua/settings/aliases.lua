-- Aliases that'll be used throughout this config.

--- Aliases for vim dictionary keys.

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

--- Config specific utility aliases.

utils = require "utils" -- dev related utils
mappings = require "utils.mappings" -- mapping related utils
neovim = require "utils.neovim" -- frequently used neovim API functions

theming = require "utils.theming" -- theming related utils
hi = theming.highlight -- add a highlight

-- create user commands that
alias = neovim.alias
buf_alias = neovim.buf_alias

-- cnoabbrev and auto commands
abbrev = neovim.abbrev
augroup = neovim.augroup
autocmd = neovim.autocmd
abbrev = neovim.abbrev

-- mapping aliases for different modes
xmap = mappings.xmap
imap = mappings.imap
vmap = mappings.vmap
nmap = mappings.nmap

excallback = utils.excallback -- callback that passes on args
exists = utils.exists -- sees if a path exists
notify = neovim.notify -- vim.notify alias

-- Dev aliases

pi = vim.pretty_print -- shorthand for vim.pretty_print or, print + vim.inspect
p = print -- shorthand for print
rq = utils.rq -- shorthand for require("module")
tp = utils.tp -- print type of a value

theme = require "theming" -- theming related modules such as highlight groups
cmd "colo night" -- set initial colorscheme

-- vim:ft=lua
