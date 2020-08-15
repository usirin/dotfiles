syntax on

set mouse=a
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
set hidden

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
set cursorline
" set winwidth=79
" set winminheight=1
" set winheight=1
" set winminwidth=40
set diffopt+=vertical

set scrolloff=5

set inccommand=split

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
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" persist undos across sessions
try
  set undodir=$HOME/dotfiles/nvim/temp_dirs/undodir
  set undofile
catch
endtry

let g:python3_host_prog='/usr/local/bin/python3'
let g:notes_directories = ['~/dev/usirin/notes']

" set context to current file's directory
autocmd BufEnter * silent! lcd %:p:h

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" File specific color columns
autocmd BufNewFile,BufReadPost *.coffee,*.js,*.litcoffee,*.ts,*.tsx setl colorcolumn=80,120
autocmd BufNewFile,BufReadPost *.styl,*.stylus setl colorcolumn=28
autocmd BufNewFile,BufReadPost .babelrc,.eslintrc,.prettierrc set filetype=json

autocmd FileType java setlocal shiftwidth=4 tabstop=4

autocmd FileType litcoffee runtime ftplugin/coffee.vim

augroup QuickFixStuff
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END
