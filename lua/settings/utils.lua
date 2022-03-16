utils = require "utils"

hi = utils.highlight
alias = utils.alias
abbrev = utils.abbrev

augroup = utils.augroup
autocmd = utils.autocmd
abbrev = utils.abbrev

xmap = utils.xmap
imap = utils.imap
vmap = utils.vmap
nmap = utils.nmap

excallback = utils.excallback
exists = utils.exists
notify = utils.notify
pi = utils.pi

cmd "colorscheme nordic"
colors = require("utils").get_active_scheme()
