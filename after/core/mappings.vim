for mode in ['v', 'i', 'n']
  exe mode . 'noremap <up> <nop>'
  exe mode . 'noremap <down> <nop>'
  exe mode . 'noremap <left> <nop>'
  exe mode . 'noremap <right> <nop>'
endfor

nmap <leader>Y "+Y
nmap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>f :g/<C-R><C-W>/#<CR>:

nmap ]q :cnext<CR>
nmap [q :cprev<CR>

nmap <leader>s :Track<CR>
nmap <leader>aa :TrackMark<CR>
nmap <leader>dd :TrackUnmark<CR>

nmap <leader>] :bnext<CR>
nmap <leader>[ :bprev<CR>
nmap <leader>q :lua require'dharmx.utils'.close()<CR>
nmap <leader>u :UndotreeToggle<CR>

nmap <F2> :set spell!<CR>
nmap <F3> :ColorizerToggle<CR>
nmap <C-S> :update<CR>
nmap <C-N> :RnvimrToggle<CR>
nmap <C-\> :ToggleTerm<CR>

nmap <leader>bb :Telescope buffers<CR>
nmap <leader>ff :Telescope media media<CR>
nmap <leader>fg :Telescope live_grep<CR>
nmap <leader>gc :Telescope git_commits<CR>
