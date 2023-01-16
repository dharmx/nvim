local opt = vim.opt

opt.termguicolors = true
opt.textwidth = 120
opt.colorcolumn = { 0 }
opt.laststatus = 3
opt.backspace = {
  "indent",
  "eol",
  "start",
}
opt.completeopt = "menuone,noselect"
opt.title = true
opt.hidden = false
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 0
opt.autowrite = true
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.wildignore = {
  "*/cache/*",
  "*/tmp/*",
}
opt.errorformat = "%f|%l col %c|%m"
opt.fillchars = {
  eob = " ",
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
  fold = "─",
}
opt.foldcolumn = "auto"
opt.foldmethod = "marker"
opt.ignorecase = false
opt.smartcase = true
opt.mouse = "a"
opt.undolevels = 10000
opt.number = true
opt.numberwidth = 1
opt.relativenumber = false
opt.fileencoding = "utf8"
opt.tabstop = 4
opt.timeoutlen = 250
opt.undofile = true
opt.updatetime = 500
opt.wrap = false
opt.spell = false
opt.spelllang = "en_us,en_gb,cjk"
opt.spellsuggest = "best,9"
opt.spelloptions = { "camel", "noplainbuffer" }
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.backup = false
opt.showmode = true
opt.showcmd = true
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
opt.omnifunc = "syntaxcomplete#Complete"
opt.background = "dark"

opt.iskeyword = "@,48-57,_,192-255"
opt.whichwrap:append("<>[]hl")
opt.shortmess:append("sI")
opt.diffopt:append("algorithm:patience")
opt.showtabline = 1

-- vim:filetype=lua
