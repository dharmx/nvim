if bufname() == '[Command Line]'
  setlocal signcolumn=no
  setlocal norelativenumber
  nmap <buffer> q :q<CR>
endif
