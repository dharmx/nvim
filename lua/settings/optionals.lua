--- Set up vim opts.
-- @module settings.optionals

local O = {} -- options settings
local A = {} -- options that are needed to be appeneded
local E = {} -- env variables in the current nvim session
local R = {} -- options that are needed to be removed
local P = {} -- options that are needed to be prepended

--[[
  O -> vim.opt.some_option = <value>
  E -> vim.env.SOME_ENV = <VALUE>
  R -> vim.opt.some_option:remove { <SOME_VALUE-1>, <SOME_VALUE-2>  }
  A -> vim.opt.some_option:append { <SOME_VALUE-1>, <SOME_VALUE-2> }
  P -> vim.opt.some_option:prepend { <SOME_VALUE-1>, <SOME_VALUE-2> }
--]]

O["termguicolors"] = true -- Enables 24-bit RGB color in the TUI.  Uses "gui" :highlight
O["laststatus"] = 3 -- enables the global statusline
O["backspace"] = { "indent", "eol", "start" } -- show backspace characters
O["completeopt"] = "menuone,noselect" -- completion options
O["title"] = true -- set window title same as the file name
O["hidden"] = false -- remove all undo info (with undo info)
O["signcolumn"] = "yes" -- shows signs in the number column
O["splitbelow"] = true -- spawn new buffer below
O["splitright"] = true -- spawn new buffer to the right
O["clipboard"] = "unnamedplus" -- uses the system clipboard '*' for all yank, delete, change
O["cmdheight"] = 1 -- height of the cmdline input field
O["autowrite"] = true -- write the contents of the file, if it has been modified
O["autoindent"] = true -- copy indent from current line when starting a new line
O["expandtab"] = true -- insert mode: use the appropriate number of spaces to insert <tab>
O["shiftwidth"] = 2 -- affects >>, << or == maps and autoindent
O["smartindent"] = true -- reacts to the syntax/style of the code
O["wildignore"] = { "*/cache/*", "*/tmp/*" } -- these	patterns is ignored when expanding wildcards
O["errorformat"] = "%f|%l col %c|%m" -- option specifies a list of formats that are recognized
O["fillchars"] = { -- Characters to fill the statuslines and vertical separators. See :h 'fillchars'
  eob = " ",
  stlnc = " ",
  diff = "░",
  msgsep = "━",
  foldopen = "▾",
  foldsep = "|",
  foldclose = "▸",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}
O["ignorecase"] = false -- if its on, the case of normal letters is ignored
O["smartcase"] = true -- 	override 'ignorecase' if search pattern contains uppercase
O["mouse"] = "a" -- enable mouse support
O["undolevels"] = 10000 -- number of undo changes that'll be stored for each file
O["number"] = true -- enable/disable number column
O["numberwidth"] = 2 -- set width of the number column
O["relativenumber"] = false -- enable/disable relative numbering in number column
O["fileencoding"] = "utf8" -- file encoding of the current buffer
O["tabstop"] = 4 -- no of spaces that a <tab> in the file counts for
O["timeoutlen"] = 250 -- delay between keys (millisecond)
O["undofile"] = true -- enable/disable persistent undo
O["updatetime"] = 500 -- after this delay swap file will be (re)written
O["wrap"] = false -- enable/disable text wrap
O["spell"] = false -- enable/disable spellcheck
O["spelllang"] = "en_us,en_gb,cjk" -- set spellcheck lang
O["spellsuggest"] = "best,9" -- see :h ;spellsuggest'
O["scrolloff"] = 8 -- min no of screen lines to keep above and below the cursor
O["sidescrolloff"] = 8 -- min no. of screen cols to keep left and right of the cursor if nowrap is set
O["backup"] = false -- no backup of the original file will be made
O["showmode"] = true -- if in Insert, Replace or Visual mode put a message on the last line
O["showcmd"] = true -- show (partial) command in the last line of the screen
O["hlsearch"] = true -- when there is a prev search pattern, hl all its matches
O["conceallevel"] = 2 -- determine how text with the "conceal" syntax attribute is shown
O["swapfile"] = false -- do not prompt if neovim is forcefully closed or, crashed
O["cursorline"] = true -- highlight the text line of the cursor with CursorLine
O["cursorlineopt"] = "both" -- list of settings for how 'cursorline' is displayed
O["pumheight"] = 25 -- min height for the popup menu
O["pumwidth"] = 35 -- min width for the popup menu
O["pumblend"] = 1 -- pseudo-transparency for a popup window
O["winblend"] = 1 -- pseudo-transparency for a floating window
O["history"] = 10000 -- no of lines
O["emoji"] = true -- all Unicode emoji characters are considered to be full width
O["ruler"] = false -- show the line & column no. of the cursor position, separated by comma
O["list"] = true -- see :h 'list'
O["menuitems"] = 30 -- max number of items to use in a menu
O["magic"] = true -- see :h 'magic'
O["icon"] = true -- the icon text of the window will be set
O["omnifunc"] = "syntaxcomplete#Complete" -- default omnifunc (completion) settings
O["background"] = "dark" -- colorscheme style

A["whichwrap"] = "<>[]hl" -- see :h 'whichwrap'
A["shortmess"] = "sI" -- This option helps to avoid all the hit-enter prompts
A["diffopt"] = { "algorithm:patience" } -- options for diff mode

-- custom fzf config for neovim
E["FZF_DEFAULT_OPTS"] =
  "--layout=reverse --prompt ' ' --pointer '->' --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

return {
  options = O,
  appends = A,
  exports = E,
  prepends = P,
  removes = R,
}

-- vim:ft=lua
