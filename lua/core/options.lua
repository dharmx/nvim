local opt = vim.opt
local g = vim.g

g.mapleader = ";"
opt.backupdir = { vim.fn.stdpath("state") .. "/backup" }
opt.spellfile = { vim.fn.stdpath("config") .. "/spell/words.add" }

opt.backup = true
opt.spell = false
opt.wildmode = "longest,list,full"
opt.spelllang = "en_us,en_gb,cjk"
opt.spellsuggest = "best,9"
opt.spelloptions = "camel,noplainbuffer"
opt.exrc = true
opt.termguicolors = true
opt.textwidth = 120
opt.laststatus = 3
opt.backspace = "indent,eol,start"
opt.completeopt = "menuone,noselect"
opt.title = true
opt.hidden = true
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.clipboard = ""
opt.cmdheight = 0
opt.autowrite = true
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.wildignore = "*/cache/*,*/tmp/*"
opt.foldcolumn = "auto"
opt.foldmethod = "marker"
opt.ignorecase = false
opt.smartcase = true
opt.mouse = "nv"
opt.undolevels = 10000
opt.number = true
opt.numberwidth = 1
opt.relativenumber = false
opt.fileencoding = "UTF-8"
opt.tabstop = 4
opt.timeoutlen = 250
opt.undofile = true
opt.updatetime = 500
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = true
opt.showcmd = true
opt.showtabline = 2
opt.hlsearch = true
opt.conceallevel = 2
opt.swapfile = false
opt.cursorline = false
opt.cursorlineopt = "both"
opt.pumheight = 25
opt.pumwidth = 35
opt.pumblend = 0
opt.winblend = 0
opt.history = 10000
opt.emoji = true
opt.ruler = true
opt.list = true
opt.menuitems = 30
opt.magic = true
opt.icon = true
opt.background = "dark"

opt.whichwrap:append("<>[]hl")
opt.shortmess:append("sI")
opt.diffopt:append("algorithm:patience")
opt.formatoptions:remove("cro")
opt.fillchars = {
  stlnc = " ",
  diff = "░",
  msgsep = "━",
  foldopen = "",
  foldsep = "│",
  foldclose = "",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
  fold = "─"
}

local sign = vim.fn.sign_define
sign("DiagnosticSignError", { text = "┃", texthl = "LspDiagnosticsSignError", linehl = "LspDiagnosticsSignError" })
sign("DiagnosticSignHint", { text = "┃", texthl = "LspDiagnosticsSignHint", linehl = "LspDiagnosticsSignHint" })
sign("DiagnosticSignInfo", { text = "┃", texthl = "LspDiagnosticsSignInfo", linehl = "LspDiagnosticsSignInfo" })
sign("DiagnosticSignWarn", { text = "┃", texthl = "LspDiagnosticsSignWarn", linehl = "LspDiagnosticsSignWarn" })
sign("DapBreakpoint", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg" })
sign("DapLogPoint", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg" })
sign("DapBreakpointCondition", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg" })
sign("DapBreakpointRejected", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg" })
sign("DapStopped", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg" })
