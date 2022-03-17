local O = {}
local A = {}
local E = {}

O["termguicolors"] = true
O["laststatus"] = 2
O["completeopt"] = "menuone,noselect"
O["title"] = true
O["hidden"] = true
O["signcolumn"] = "yes"
O["splitbelow"] = true
O["splitright"] = true
O["clipboard"] = "unnamedplus"
O["cmdheight"] = 1
O["autowrite"] = true
O["autoindent"] = true
O["expandtab"] = true
O["shiftwidth"] = 2
O["smartindent"] = true
O["wildignore"] = { "*/cache/*", "*/tmp/*" }
O["errorformat"] = "%f|%l col %c|%m"
O["fillchars"] = {
  eob = " ",
  vert = "▎",
  stlnc = "━",
  diff = "░",
  msgsep = "━",
  foldopen = "▾",
  foldsep = "|",
  foldclose = "▸",
}
O["ignorecase"] = false
O["smartcase"] = true
O["mouse"] = "a"
O["undolevels"] = 10000
O["number"] = false
O["numberwidth"] = 2
O["relativenumber"] = false
O["fileencoding"] = "utf-8"
O["tabstop"] = 4
O["timeoutlen"] = 250
O["undofile"] = true
O["updatetime"] = 250
O["wrap"] = false
O["list"] = true
O["spell"] = false
O["spelllang"] = "en_us,en_gb,cjk"
O["spellsuggest"] = "best,9"
O["scrolloff"] = 8
O["sidescrolloff"] = 8
O["backup"] = false
O["showmode"] = true
O["showcmd"] = true
O["hlsearch"] = true
O["conceallevel"] = 2
O["swapfile"] = false
O["cursorline"] = true
O["cursorlineopt"] = "both"
O["signcolumn"] = "yes"
O["pumheight"] = 25
O["pumwidth"] = 35
O["pumblend"] = 0
O["history"] = 10000
O["emoji"] = true
O["ruler"] = false
O["list"] = true
O["menuitems"] = 30
O["magic"] = true
O["icon"] = true
O["omnifunc"] = "syntaxcomplete#Complete"
O["background"] = "dark"

A["whichwrap"] = "<>[]hl"
A["shortmess"] = "sI"
A["diffopt"] = { "algorithm:patience" }

E["FZF_DEFAULT_OPTS"] =
  "--layout=reverse --prompt ' ' --pointer '->' --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

return {
  options = O,
  appends = A,
  exports = E,
}

-- vim:ft=lua
