" Better gx to open URLs.
func! __BetterGx() abort
  if exists('$WSLENV')
    lcd /mnt/c
    let cmd = ':silent !cmd.exe /C start'
  elseif has('win32') || has('win32unix')
    let cmd = ':silent !start'
  elseif executable('xdg-open')
    let cmd = ':silent !xdg-open'
  elseif executable('open')
    let cmd = ':silent !open'
  else
    echohl Error
    echomsg "Can't find proper opener for an URL!"
    echohl None
    return
  endif

  " URL regexes
  let rx_base = '\%(\%(http\|ftp\|irc\)s\?\|file\)://\S'
  let rx_bare = rx_base . '\+'
  let rx_embd = rx_base . '\{-}'

  let URL = ''

  " markdown URL [link text](http://ya.ru 'yandex search')
  try
    let save_view = winsaveview()
    if searchpair('\[.\{-}\](', '', ')\zs', 'cbW', '', line('.')) > 0
      let URL = matchstr(getline('.')[col('.')-1:], '\[.\{-}\](\zs'.rx_embd.'\ze\(\s\+.\{-}\)\?)')
    endif
  finally
    call winrestview(save_view)
  endtry

  " asciidoc URL http://yandex.ru[yandex search]
  if empty(URL)
    try
      let save_view = winsaveview()
      if searchpair(rx_bare . '\[', '', '\]\zs', 'cbW', '', line('.')) > 0
        let URL = matchstr(getline('.')[col('.')-1:], '\S\{-}\ze[')
      endif
    finally
      call winrestview(save_view)
    endtry
  endif

  " HTML URL <a href='http://www.python.org'>Python is here</a>
  "          <a href="http://www.python.org"/>
  if empty(URL)
    try
      let save_view = winsaveview()
      if searchpair('<a\s\+href=', '', '\%(</a>\|/>\)\zs', 'cbW', '', line('.')) > 0
        let URL = matchstr(getline('.')[col('.')-1:], 'href=["'."'".']\?\zs\S\{-}\ze["'."'".']\?/\?>')
      endif
    finally
      call winrestview(save_view)
    endtry
  endif

  " barebone URL http://google.com
  if empty(URL)
    let URL = matchstr(expand('<cfile>'), rx_bare)
  endif

  if empty(URL)
    return
  endif

  exe cmd . ' "' . escape(URL, '#%!')  . '"'
  if exists('$WSLENV') | lcd - | endif
endfunc
nnoremap <silent> gx :call __BetterGx()<CR>
