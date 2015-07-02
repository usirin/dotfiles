set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-surround'
Plugin 'jlangston/tomorrow-night-vim'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'wavded/vim-stylus'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'majutsushi/tagbar'
Plugin 'derekwyatt/ag.vim'
Plugin 'fatih/vim-go'
Plugin 'duythinht/vim-coffee'
Plugin 'quanganhdo/grb256'
Plugin 'Chiel92/vim-autoformat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'mtscout6/vim-cjsx'
Plugin 'altercation/vim-colors-solarized'
Plugin 'reedes/vim-colors-pencil'
Plugin 'yosiat/oceanic-next-vim'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'whatyouhide/vim-gotham'
Plugin 'dyng/ctrlsf.vim'
Plugin 'dbakker/vim-projectroot'

call vundle#end()              " required
filetype plugin indent on      " required

syntax enable

set visualbell
set noerrorbells               " No beeps
set number                     " Show line numbers

set backspace=indent,eol,start " Makes backspace key work normally
set showcmd                    " Shows what is typed
set showmode                   " Show current mode

set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create backup files
set splitright                 " Split vertical windows right
set splitbelow                 " Split horizontal windows below
set encoding=utf-8             " Set default encoding to UTF-8
set autowrite                  " Automatically save before :next, :make etc.
set autoread                   " Automatically reread changed files without asking me anything
set laststatus=2               " Always show status bar
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

set fileformats=unix,dos,mac   " Prefer Unix over Windows over OS 9 formats

" control with mouse ~will probably turn off
set mouse=a

" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
" set clipboard^=unnamed
" set clipboard^=unnamedplus

set noshowmatch                     " Do not show matching brackets by flickering
set lazyredraw                      " Wait to redraw
set incsearch                       " Shows the match while typing
set hlsearch                        " Highlight found searches
set ignorecase                      " Search case insensitive...
set smartcase                       " ... but not when search pattern contains upper case characters
set ttyfast
set list listchars=tab:\ \ ,trail:Â·,nbsp:Â· " highlight tailing whitespace

set expandtab
set tabstop=2
set smarttab
set shiftwidth=2

set scrolloff=5

" Different tab-space styles for different languages
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab " CoffeeScript
autocmd BufNewFile,BufReadPost *.js     setl shiftwidth=2 expandtab " JavaScript

" lets make sure we don't show these files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

autocmd BufEnter * silent! lcd %:p:h " set context to current file's directory

syntax enable
set timeout timeoutlen=500 ttimeoutlen=1

" set t_Co=256
let &t_Co=256
" let &t_Co=16
colorscheme gotham
set background=dark

let coffee_compiler = '/usr/local/bin/cjsx'

" set color column to lighter grey
hi ColorColumn ctermbg=236

" show only underline for search highlights
hi Search ctermbg=NONE ctermfg=NONE cterm=underline

" gitgutter column bg
hi clear SignColumn
hi SignColumn ctermfg=none ctermbg=none

autocmd BufNewFile,BufReadPost *.coffee setl colorcolumn=80
autocmd BufNewFile,BufReadPost *.styl setl colorcolumn=28

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

let mapleader=","

" map ; to : for normal mode
nnoremap ; :

" Remove search highlight
nnoremap <leader><space> :nohlsearch<cr>

" Ag the word under cursor
nnoremap <leader>f :Ag "<C-R><C-W>"<cr>

" Shortcut for :b#
nnoremap <leader><leader> <c-^>


nmap <leader>a gcc
vmap <leader>a gc

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vs $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Use space for space in normal mode
nmap <space> i<space><esc>l

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" map jj to Esc
imap jj <Esc>

" Better split opening
" map <leader>` <c-w>v<c-l>
nnoremap <bar> :vsp<cr>
nnoremap _ :sp<cr>

" Relative navigation between tabs
nnoremap t[ :tabprev<CR>
nnoremap t] :tabnext<CR>
nnoremap tt :tabe<CR>

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ctrlp configs
let g:ctrlp_max_height=15
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_switch_buffer = 'et'              " jump to a file if it's open already
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files=0                       " do not limit the number of searchable files
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" CtrlSF bindings
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

function! g:NerdTreeFindToggle()
    if nerdtree#isTreeOpen()
        exec 'NERDTreeClose'
    else
        exec 'NERDTreeFind'
    endif
endfunction
noremap <leader>kb :<C-u>call g:NerdTreeFindToggle()<cr>

map <leader>pi :PluginInstall<cr>

map <leader>j :!npm test<cr>

map <leader>b :!gulp browserify<cr>

map <leader>n :!coffee %<cr>

map <leader>: :Tabularize /:<cr>
map <leader>= :Tabularize /=<cr>
map <leader>" :Tabularize /"<cr>

map <leader>1 1gt
map <leader>2 1gt
map <leader>3 1gt
map <leader>4 1gt
map <leader>5 1gt

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Map Shift-G to be in the center
nmap <S-G> <S-G>zz

" toggle between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
map <C-M> :call NumberToggle()<cr>

let g:airline_powerline_fonts=1

" persist undos across sessions
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

" Add new lines before entering insert mode
nnoremap <Enter> o<Esc>
nnoremap <c-cr> O<cr><Esc>

if has("gui_macvim")
  set guifont=InputMono\ Light\ for\ Powerline:h14
endif


" MACROS

" Add markdox definition to method. Just placeholder.
let @m = 'O€kb###* *€kb###kA '

let @a = 'O€kb###o€kb *o€kb***€kb€kb€kb###kkA*jA '

let @c = 'ireturn callback err  if err'
