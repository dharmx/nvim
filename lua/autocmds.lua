local util = require "utils"
local autocmd = util.autocmd
local augroup = util.augroup
local cmd = vim.api.nvim_command

cmd "cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))"
cmd "cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))"
cmd "cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))"
cmd "cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))"
cmd "cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q!'):('q'))"
cmd "cnoreabbrev <expr> q ((getcmdtype() is# ':' && getcmdline() is# 'q')?('q!'):('q'))"

autocmd("TextYankPost", function() vim.highlight.on_yank { higroup = "YankFeed", timeout = 150 } end)
autocmd("TermOpen", "setlocal nonumber norelativenumber | setfiletype terminal", { patterns = "term://" })
autocmd("FileType", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
autocmd("BufReadPost", "let &l:modifiable = !&readonly")
autocmd("BufWritePost", function() require("packer").compile() end, { patterns = "*/lua/plugins.lua" })
autocmd("VimEnter", function() util.dashboard_vimenter() end, "*/lua/plugins.lua")

augroup("ListCharsFeedback", {
  { 
    events = "InsertEnter", 
    command = function() 
      vim.opt_local.listchars = { 
        tab = ' ', 
        trail = '·', 
        space = '⋅', 
        eol = '↴',
      } 
    end
  },
  { 
    events = "InsertLeave", 
    command = function() vim.opt_local.listchars = '' end 
  },
})

--[[
cmd "augroup RelativeFeedback"
cmd "  autocmd!"
cmd "  autocmd InsertEnter * silent! set norelativenumber"
cmd "  autocmd InsertLeave * silent! set relativenumber"
cmd "augroup END"

cmd "augroup NumberFeedback"
cmd "  autocmd!"
cmd "  autocmd InsertEnter * silent! set number"
cmd "  autocmd InsertLeave * silent! set nonumber"
cmd "augroup END"


cmd "augroup CursorLineFeedback"
cmd "  autocmd!"
cmd "  autocmd BufEnter,WinEnter,InsertLeave * silent! lua vim.opt_local.cursorline = false"
cmd "  autocmd BufLeave,WinLeave,InsertEnter * silent! lua vim.opt_local.cursorline = true"
cmd "augroup END"

cmd "augroup ScrollbarInit"
cmd "  autocmd!"
cmd "  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()"
cmd "  autocmd WinEnter,FocusGained * silent! lua require('scrollbar').show()"
cmd "  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost * silent! lua require('scrollbar').clear()"
cmd "augroup END"
]]

-- vim:ft=lua
