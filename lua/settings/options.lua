local opt = vim.opt
local wo = vim.wo

opt.termguicolors = true
opt.completeopt = "menuone,noselect"

opt.shadafile = ""
opt.ttyfast = true
opt.title = true
opt.hidden = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true

opt.whichwrap:append "<>[]hl"

opt.clipboard = "unnamedplus"
opt.cmdheight = 1

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.fillchars = {
  eob = " ",
  vert = "▎",
  stlnc = "━",
  diff = "░",
  msgsep = "━",
  foldopen = "▾",
  foldsep = "|",
  foldclose = "▸",
}

opt.ignorecase = false
opt.smartcase = true
opt.mouse = "a"
opt.undolevels = 10000

opt.number = true
opt.numberwidth = 2
opt.relativenumber = false
opt.fileencoding = "utf-8"

opt.tabstop = 4
opt.timeoutlen = 300
opt.undofile = true

opt.updatetime = 250
opt.wrap = false

opt.list = true
opt.spell = false
opt.spelllang = "en_us,en_gb,cjk"
opt.spellsuggest = "best,9"

-- These two are required for neoscroll to work properly.
-- @see https://github.com/neovim/neovim/issues/13964
-- @see https://github.com/karb94/neoscroll.nvim/issues/28
-- @see https://github.com/karb94/neoscroll.nvim/issues/11
opt.scrolloff = 8
wo.scrolloff = 8

opt.sidescrolloff = 8
opt.backup = false

opt.showmode = true
opt.shortmess:append "IAa"
opt.showcmd = true

opt.hlsearch = true
opt.conceallevel = 2
opt.swapfile = false

opt.cursorline = true
opt.cursorlineopt = "both"
opt.signcolumn = "yes"

opt.pumheight = 25
opt.pumwidth = 35
opt.pumblend = 0
opt.history = 10000

opt.emoji = true
opt.ruler = false
opt.list = true
opt.menuitems = 30
opt.magic = true
opt.icon = true
