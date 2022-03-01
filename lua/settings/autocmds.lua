local M = {}
local cmd = vim.api.nvim_command

M["relative_feedback"] = function()
  cmd "augroup RelativeFeedback"
  cmd "  autocmd!"
  cmd "  autocmd InsertEnter * silent! set norelativenumber"
  cmd "  autocmd InsertLeave * silent! set relativenumber"
  cmd "augroup END"
end

M["number_feedback"] = function()
  cmd "augroup RelativeFeedback"
  cmd "  autocmd!"
  cmd "  autocmd InsertEnter * silent! set number"
  cmd "  autocmd InsertLeave * silent! set nonumber"
  cmd "augroup END"
end

M["listchars_feedback"] = function()
  cmd "augroup ListCharsFeedback"
  cmd "  autocmd!"
  cmd "  autocmd InsertLeave * silent! lua vim.opt_local.listchars = { tab = ' ', trail = '·', space = '⋅', eol = '↴' }"
  cmd "  autocmd InsertEnter * silent! lua vim.opt_local.listchars = ''"
  cmd "augroup END"
end

M["yank_feedback"] = function()
  cmd "augroup YankFeedback"
  cmd "  autocmd!"
  cmd "  autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='YankFeed', timeout=150})"
  cmd "augroup END"
end

M["cursorline_feedback"] = function()
  cmd "augroup CursorLineFeedback"
  cmd "  autocmd!"
  cmd "  autocmd BufEnter,WinEnter,InsertLeave * silent! lua vim.opt_local.cursorline = false"
  cmd "  autocmd BufLeave,WinLeave,InsertEnter * silent! lua vim.opt_local.cursorline = true"
  cmd "augroup END"
end

M["scrollbar_init"] = function()
  cmd "augroup ScrollbarInit"
  cmd "  autocmd!"
  cmd "  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()"
  cmd "  autocmd WinEnter,FocusGained * silent! lua require('scrollbar').show()"
  cmd "  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost * silent! lua require('scrollbar').clear()"
  cmd "augroup end"
end

M["term_non_relative"] = function()
  cmd "autocmd TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal"
end

M["filetype_format"] = function()
  cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
end

M["block_read_only"] = function()
  cmd "augroup BlockReadOnly"
  cmd "  autocmd!"
  cmd "  autocmd BufReadPost * let &l:modifiable = !&readonly"
  cmd "augroup end"
end

M["plugins_auto_source"] = function()
  cmd "augroup AutoSourcePluginSpecsOnChange"
  cmd "  autocmd!"
  cmd "  autocmd BufWritePost */lua/plugins/*.lua silent! lua require('packer').compile()"
  cmd "augroup end"
end

M["nvimrc_auto_source"] = function()
  cmd "augroup AutoSourceNVIMRCOnChange"
  cmd "  autocmd!"
  cmd "  autocmd BufWritePost */lua/nvimrc.lua silent! lua require('packer').compile()"
  cmd "augroup end"
end

return M
