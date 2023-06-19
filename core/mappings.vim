for mode in ['v', 'i', 'n']
  execute mode . 'noremap <up> <nop>'
  execute mode . 'noremap <down> <nop>'
  execute mode . 'noremap <left> <nop>'
  execute mode . 'noremap <right> <nop>'
endfor

nnoremap <silent> <leader>q :copen<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <silent> <C-[> <cmd>nohlsearch<cr>

nnoremap <leader>Y "+Y
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader># :g/<C-R><C-W>/#<CR>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

nnoremap <silent> <C-Up> :resize -2<CR>
nnoremap <silent> <C-Down> :resize +2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [a :previous<CR>
nnoremap ]a :next<CR>

nnoremap <leader><leader> :Track<CR>
nnoremap <leader>aa :TrackMark<CR>
nnoremap <leader>dd :TrackUnmark<CR>

nnoremap <leader>c :lua require'dharmx.utils'.close()<CR>
nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <F1> :ColorizerToggle<CR>
nnoremap <F2> :setlocal spell!<CR>
nnoremap <F3> :make<CR>

nnoremap <C-S> :update<CR>
nnoremap <C-N> :RnvimrToggle<CR>
nnoremap <C-\> :ToggleTerm<CR>

nnoremap <leader>bb :Telescope buffers<CR>
nnoremap <leader>ff :Telescope media<CR>
nnoremap <leader>gg :Telescope live_grep<CR>
nnoremap <leader>mm :Telescope marks<CR>
nnoremap <leader>rr :Telescope registers<CR>
nnoremap <leader>jj :Telescope jumplist<CR>
nnoremap <leader>ll :Telescope loclist<CR>

nnoremap <silent> <A-k> :MoveLine(-1)<CR>
nnoremap <silent> <A-j> :MoveLine(1)<CR>
nnoremap <silent> <A-l> :MoveHChar(1)<CR>
nnoremap <silent> <A-h> :MoveHChar(-1)<CR>
nnoremap <silent> <leader>wf :MoveWord(1)<CR>
nnoremap <silent> <leader>wb :MoveWord(-1)<CR>

vnoremap <silent> <A-j> :MoveBlock(1)<CR>
vnoremap <silent> <A-k> :MoveBlock(-1)<CR>
vnoremap <silent> <A-h> :MoveHBlock(-1)<CR>
vnoremap <silent> <A-l> :MoveHBlock(1)<CR>

nnoremap <leader>s mm$F r<CR>`m
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') .. '/' : '%%'
