_G.utils = require "utils"
_G.mappings = require "utils.mappings"
_G.neovim = require "utils.neovim"
_G.theming = require "utils.theming"

_G.hi = theming.highlight

_G.alias = neovim.alias
_G.abbrev = neovim.abbrev
_G.augroup = neovim.augroup
_G.autocmd = neovim.autocmd
_G.abbrev = neovim.abbrev

_G.xmap = mappings.xmap
_G.imap = mappings.imap
_G.vmap = mappings.vmap
_G.nmap = mappings.nmap

_G.excallback = utils.excallback
_G.exists = utils.exists
_G.notify = neovim.notify
_G.pi = utils.pi
_G.p = utils.p

cmd "colorscheme nordic"
_G.colors = theming.get_active_scheme()

_G.statusline = require "statusline.tables"

-- vim:ft=lua
