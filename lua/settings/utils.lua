utils = require "utils"
mappings = require "utils.mappings"
neovim = require "utils.neovim"
theming = require "utils.theming"

hi = theming.highlight

alias = neovim.alias
abbrev = neovim.abbrev
augroup = neovim.augroup
autocmd = neovim.autocmd
abbrev = neovim.abbrev

xmap = mappings.xmap
imap = mappings.imap
vmap = mappings.vmap
nmap = mappings.nmap

excallback = utils.excallback
exists = utils.exists
notify = neovim.notify
pi = utils.pi
p = utils.p

cmd "colorscheme nordic"
colors = theming.get_active_scheme()

-- vim:ft=lua
