vmap <leader>y "+y
nmap <leader>y "+y
nmap <leader>Y "+Y

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
