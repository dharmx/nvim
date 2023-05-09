augroup DharmxGroup
  autocmd!
  autocmd TextYankPost * lua vim.highlight.on_yank{higroup='MoreMsg',on_visual=true}
  autocmd TermOpen,BufReadCmd term://*,zsh,*/zsh,sh,bash,toggleterm set nonu nornu
  autocmd BufWritePre * lua require'dharmx.utils.extras'.auto_mkdirs()
  autocmd BufWinLeave *.md mkview
  autocmd BufWinEnter *.md silent! loadview

  autocmd FileType checkhealth,help,notify,oil,qf,query nmap <buffer> q :q<CR>
  autocmd FileType alpha nmap <buffer> q :Alpha<CR>
  autocmd FileType tsplayground nmap <buffer> q :TSPlaygroundToggle<CR>
  autocmd FileType qf setlocal number
augroup END
