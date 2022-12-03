-- Set up vim opts.

local opt = vim.opt
local env = vim.env

opt.termguicolors = true -- Enables 24-bit RGB color in the TUI.  Uses "gui" :highlight
opt.textwidth = 120
opt.colorcolumn = { 0 }
opt.laststatus = 3 -- enables the global statusline
opt.backspace = {
  "indent",
  "eol",
  "start",
} -- show backspace characters
opt.completeopt = "menuone,noselect" -- completion options
opt.title = true -- set window title same as the file name
opt.hidden = false -- remove all undo info (with undo info)
opt.signcolumn = "yes" -- shows signs in the number column
opt.splitbelow = true -- spawn new buffer below
opt.splitright = true -- spawn new buffer to the right
opt.clipboard = "unnamedplus" -- uses the system clipboard '*' for all yank, delete, change
opt.cmdheight = 0 -- height of the cmdline input field
opt.autowrite = true -- write the contents of the file, if it has been modified
opt.autoindent = true -- copy indent from current line when starting a new line
opt.expandtab = true -- insert mode: use the appropriate number of spaces to insert <tab>
opt.shiftwidth = 2 -- affects >>, << or == maps and autoindent
opt.smartindent = true -- reacts to the syntax/style of the code
opt.wildignore = {
  "*/cache/*",
  "*/tmp/*",
} -- these	patterns is ignored when expanding wildcards
opt.errorformat = "%f|%l col %c|%m" -- option specifies a list of formats that are recognized
opt.fillchars = { -- Characters to fill the statuslines and vertical separators. See :h 'fillchars'
  eob = " ", --- setting this to ~ will display ~ on numcol after it ends
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
opt.ignorecase = false -- if its on, the case of normal letters is ignored
opt.smartcase = true -- override 'ignorecase' if search pattern contains uppercase
opt.mouse = "a" -- enable mouse support
opt.undolevels = 10000 -- number of undo changes that'll be stored for each file
opt.number = true -- enable/disable number column
opt.numberwidth = 1 -- set width of the number column
opt.relativenumber = false -- enable/disable relative numbering in number column
opt.fileencoding = "utf8" -- file encoding of the current buffer
opt.tabstop = 4 -- no of spaces that a <tab> in the file counts for
opt.timeoutlen = 250 -- delay between keys (millisecond)
opt.undofile = true -- enable/disable persistent undo
opt.updatetime = 500 -- after this delay swap file will be (re)written
opt.wrap = false -- enable/disable text wrap
opt.spell = false -- enable/disable spellcheck
opt.spelllang = "en_us,en_gb,cjk" -- set spellcheck lang
opt.spellsuggest = "best,9" -- see :h ;spellsuggest'
opt.scrolloff = 8 -- min no of screen lines to keep above and below the cursor
opt.sidescrolloff = 8 -- min no. of screen cols to keep left and right of the cursor if nowrap is set
opt.backup = false -- no backup of the original file will be made
opt.showmode = true -- if in Insert, Replace or Visual mode put a message on the last line
opt.showcmd = true -- show (partial) command in the last line of the screen
opt.hlsearch = true -- when there is a prev search pattern, hl all its matches
opt.conceallevel = 2 -- determine how text with the "conceal" syntax attribute is shown
opt.swapfile = false -- do not prompt if neovim is forcefully closed or, crashed
opt.cursorline = false -- highlight the text line of the cursor with CursorLine
opt.cursorlineopt = "both" -- list of settings for how 'cursorline' is displayed
opt.pumheight = 25 -- min height for the popup menu
opt.pumwidth = 35 -- min width for the popup menu
opt.pumblend = 0 -- pseudo-transparency for a popup window
opt.winblend = 0 -- pseudo-transparency for a floating window
opt.history = 10000 -- no of lines
opt.emoji = true -- all Unicode emoji characters are considered to be full width
opt.ruler = true -- show the line & column no. of the cursor position, separated by comma
opt.list = true -- see :h 'list'
opt.menuitems = 30 -- max number of items to use in a menu
opt.magic = true -- see :h 'magic'
opt.icon = true -- the icon text of the window will be set
opt.omnifunc = "syntaxcomplete#Complete" -- default omnifunc (completion) settings
opt.background = "dark" -- colorscheme style

opt.iskeyword = "@,48-57,_,192-255"
opt.whichwrap:append("<>[]hl") -- see :h 'whichwrap'
opt.shortmess:append("sI") -- This option helps to avoid all the hit-enter prompts
opt.diffopt:append("algorithm:patience") -- options for diff mode
vim.cmd("set showtabline=2")

-- custom fzf config for neovim
env.FZF_DEFAULT_OPTS =
  "--layout=reverse --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

-- vim:ft=lua
