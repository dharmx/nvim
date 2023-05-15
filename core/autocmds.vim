augroup DharmxGroup
  autocmd!
  autocmd TextYankPost * lua vim.highlight.on_yank{higroup='MoreMsg',on_visual=true}
  autocmd TermOpen,BufReadCmd term://*,zsh,*/zsh,sh,bash,toggleterm setlocal nonu nornu
  autocmd BufWritePre * lua require'dharmx.utils.extras'.auto_mkdirs()

  autocmd FileType,BufWinEnter *.md silent! loadview
  autocmd FileType,BufWinLeave *.md mkview

  autocmd FileType checkhealth,help,notify,oil,qf,query,man://* nmap <buffer> q :q<CR>
  autocmd FileType notify set filetype=markdown
  autocmd FileType alpha nmap <buffer> q :Alpha<CR>
  autocmd FileType tsplayground nmap <buffer> q :TSPlaygroundToggle<CR>
  autocmd FileType qf setlocal number
augroup END
