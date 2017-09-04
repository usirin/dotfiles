syntax enable

set visualbell
set noerrorbells
set showcmd
set showmode
set noswapfile
set nobackup
set ttyfast
set autowrite
set autoread

set splitright
set splitbelow
set backspace=indent,eol,start
set number
set nowrap

set noshowmode

" set noshowcmd
" set nolazyredraw

set lazyredraw
set noshowmatch
set incsearch
set hlsearch
" case sensitive search
set ignorecase
" until there is a capital letter
set smartcase
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set nocursorline
set winwidth=79
set winheight=5
set winminheight=5
set winminwidth=40

set scrolloff=5

set laststatus=2
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" highlight trailing whitespace
set list listchars=tab:\ \ ,trail:·,nbsp:·
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store,*/node_modules/*
set timeout timeoutlen=500 ttimeoutlen=1

" Show a line cursor while you're in insert mode.
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Enable true color support so that we can see colors awesome.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" persist undos across sessions
try
  set undodir=$DOTFILES/nvim/temp_dirs/undodir
  set undofile
catch
endtry

let g:python3_host_prog='/usr/local/bin/python3'
let g:notes_directories = ['~/dev/usirin/notes']
