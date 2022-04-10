--- Config specific utility aliases.
-- @module settings.utils

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
pi = vim.pretty_print -- shorthand for vim.pretty_print or, print + vim.inspect
p = print -- shorthand for print
rq = utils.rq -- shorthand for require("module")
tp = utils.tp -- print type of a value

theme = require "theming" -- theming related modules such as highlight groups
cmd "colo night" -- set initial colorscheme

-- vim:ft=lua
