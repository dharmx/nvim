local cmd = vim.api.nvim_command

local enabled = {
  relative = false,
  listchars = true,
  cursorline = true,
  yank_feedback = true,
  scrollbar = false,
  no_term_relative = true,
  ft_fmt = true,
  block_read_only = true,
}

if enabled.relative then
  cmd "autocmd InsertEnter * set norelativenumber"
  cmd "autocmd InsertLeave * set relativenumber"
end

if enabled.listchars then
  cmd "autocmd InsertLeave * lua vim.opt_local.listchars = { tab = ' ', trail = '·', space = '⋅', eol = '↴' }"
  cmd "autocmd InsertEnter * lua vim.opt_local.listchars = ''"
end

if enabled.yank_feedback then
  cmd "augroup VisualiseYank"
  cmd "  autocmd!"
  cmd "  autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='YankFeed', timeout=150})"
  cmd "augroup END"
end

if enabled.cursorline then
  cmd "augroup CursorLine"
  cmd "  autocmd!"
  cmd "  autocmd BufEnter,WinEnter,InsertLeave * silent! lua vim.opt_local.cursorline = false"
  cmd "  autocmd BufLeave,WinLeave,InsertEnter * silent! lua vim.opt_local.cursorline = true"
  cmd "augroup END"
end

if enabled.scrollbar then
  cmd "augroup ScrollbarInit"
  cmd "  autocmd!"
  cmd "  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()"
  cmd "  autocmd WinEnter,FocusGained * silent! lua require('scrollbar').show()"
  cmd "  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost * silent! lua require('scrollbar').clear()"
  cmd "augroup end"
end

if enabled.no_term_relative then
  cmd "autocmd TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal"
end

if enabled.fl_fmt then
  cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
end

if enabled.block_read_only then
  cmd "augroup BlockReadOnly"
  cmd "  autocmd!"
  cmd "  autocmd BufReadPost * let &l:modifiable = !&readonly"
  cmd "augroup end"
end
