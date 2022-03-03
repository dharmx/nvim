local cmd = vim.api.nvim_command

cmd "cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))"
cmd "cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))"
cmd "cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))"
cmd "cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))"

cmd "cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q!'):('q'))"
cmd "cnoreabbrev <expr> q ((getcmdtype() is# ':' && getcmdline() is# 'q')?('q!'):('q'))"

cmd "augroup YankFeedback"
cmd "  autocmd!"
cmd "  autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='YankFeed', timeout=150})"
cmd "augroup END"

cmd "autocmd TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal"

cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"

cmd "augroup BlockReadOnly"
cmd "  autocmd!"
cmd "  autocmd BufReadPost * let &l:modifiable = !&readonly"
cmd "augroup END"

cmd "augroup AutoSourcePluginSpecsOnChange"
cmd "  autocmd!"
cmd "  autocmd BufWritePost */lua/plugins.lua silent! lua require('packer').compile()"
cmd "augroup END"

cmd "augroup ToggleBufferlineOnDashboard"
cmd "  autocmd!"
cmd "  autocmd CmdlineEnter * lua require('utils').toggle_tabline_on_dashboard()"
cmd "augroup END"

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

cmd "augroup ListCharsFeedback"
cmd "  autocmd!"
cmd "  autocmd InsertLeave * silent! lua vim.opt_local.listchars = { tab = ' ', trail = '·', space = '⋅', eol = '↴' }"
cmd "  autocmd InsertEnter * silent! lua vim.opt_local.listchars = ''"
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
