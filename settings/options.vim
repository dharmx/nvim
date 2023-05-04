scriptencoding UTF-8

let &backupdir=stdpath('state') . '/backup'
let &spellfile=stdpath('config') . '/spell/words.add'

set backup
set nospell
set spelllang=en_us,en_gb,cjk
set spellsuggest=best,9
set spelloptions=camel,noplainbuffer
set noexrc
set termguicolors
set textwidth=120
set colorcolumn=120
set laststatus=3
set backspace=indent,eol,start
set completeopt=menuone,noselect
set title
set nohidden
set signcolumn=yes
set splitbelow
set splitright
set clipboard=
set cmdheight=1
set autowrite
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set wildignore=*/cache/*,*/tmp/*
set errorformat=%f\|%l\ col\ %c\|%m
set foldcolumn=auto
set foldmethod=marker
set noignorecase
set smartcase
set mouse=nv
set undolevels=10000
set number
set numberwidth=1
set norelativenumber
set fileencoding=UTF-8
set tabstop=4
set timeoutlen=250
set undofile
set updatetime=500
set nowrap
set scrolloff=8
set sidescrolloff=8
set showmode
set showcmd
set showtabline=1
set hlsearch
set conceallevel=2
set noswapfile
set nocursorline
set cursorlineopt=both
set pumheight=25
set pumwidth=35
set pumblend=0
set winblend=0
set history=10000
set emoji
set ruler
set list
set menuitems=30
set magic
set icon

set omnifunc=syntaxcomplete#Complete
set background=dark
set whichwrap+=<>[]hl
set shortmess+=sI
set diffopt+=algorithm:patience
set formatoptions-=cro
set fillchars=eob:\ ,stlnc:\ ,diff:░,msgsep:━,foldopen:,foldsep:│,foldclose:,horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┫,vertright:┣,verthoriz:╋,fold:─
