let working = getcwd()
if working == stdpath('config')
  setlocal keywordprg=:help
elseif match(working, '^' . $HOME . '/Projects/neovim') != -1
  setlocal keywordprg=:help
elseif match(working, '^' . $HOME . '/Scratch/neovim') != -1
  setlocal keywordprg=:help
endif
