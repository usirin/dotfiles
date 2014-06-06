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
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-surround'
Plugin 'jlangston/tomorrow-night-vim'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'

call vundle#end()              " required
filetype plugin indent on      " required

syntax enable

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

" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

set noshowmatch                     " Do not show matching brackets by flickering
set lazyredraw                      " Wait to redraw
set incsearch                       " Shows the match while typing
set hlsearch                        " Highlight found searches
set ignorecase                      " Search case insensitive...
set smartcase                       " ... but not when search pattern contains upper case characters
set ttyfast
set list listchars=tab:\ \ ,trail:· " highlight tailing whitespace

set expandtab
set tabstop=2
set shiftwidth=2

" lets make sure we don't show these files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

autocmd BufEnter * silent! lcd %:p:h " set context to current file's directory

if has("gui_macvim")
    " No toolbars, menu or scrollbars in the GUI
    " set guifont=Source\ Code\ Pro:h13
    set guifont=Source\ Code\ Pro:h15
    set clipboard+=unnamed
    set vb t_vb=
    set guioptions-=m  "no menu
    set guioptions-=T  "no toolbar
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r  "no scrollbar
    set guioptions-=R

    let macvim_skip_colorscheme=1
    let g:molokai_original=1
    colorscheme tomorrow-night
    highlight SignColumn guibg=#272822

    " Open ctrlp with cmd+p
    " let g:ctrlp_map = '<D-p>'

    " Open goto symbol on current buffer
    nmap <D-r> :MyCtrlPTag<cr>
    imap <D-r> <esc>:MyCtrlPTag<cr>

    " Open goto symbol on all buffers
    nmap <D-R> :CtrlPBufTagAll<cr>
    imap <D-R> <esc>:CtrlPBufTagAll<cr>

    " Open goto file
    nmap <D-t> :CtrlP<cr>
    imap <D-t> <esc>:CtrlP<cr>

    " Comment lines with cmd+/
    map <D-/> gcc
    vmap <D-/> gc<cr>gv

    " Indent lines with cmd+[ and cmd+]
    nmap <D-]> >>
    nmap <D-[> <<
    vmap <D-[> <gv
    vmap <D-]> >gv

    " This mapping makes Ctrl-Tab switch between tabs.
    " Ctrl-Shift-Tab goes the other way.
    noremap <C-Tab> :tabnext<CR>
    noremap <C-S-Tab> :tabprev<CR>

    " switch between tabs with cmd+1, cmd+2,..."
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt

    " until we have default MacVim shortcuts this is the only way to use it in
    " insert mode
    imap <D-1> <esc>1gt
    imap <D-2> <esc>2gt
    imap <D-3> <esc>3gt
    imap <D-4> <esc>4gt
    imap <D-5> <esc>5gt
    imap <D-6> <esc>6gt
    imap <D-7> <esc>7gt
    imap <D-8> <esc>8gt
    imap <D-9> <esc>9gt
else
    syntax enable
    set background=dark

    let macvim_skip_colorscheme=1
    colorscheme tomorrow-night
    highlight SignColumn guibg=#272822
    highlight VertSplit ctermbg=bg ctermfg=bg
    set t_Co=256
endif

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

let mapleader=","
let g:mapleader=","

nnoremap <leader><space> :nohlsearch<cr> " Remove search highlight

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Better split opening
map <leader>` <c-w>v<c-l>
map <leader>; <c-w>s<c-j>

let g:ctrlp_cmd = 'CtrlPMRU'                  " search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10                   " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'              " jump to a file if it's open already
let g:ctrlp_mruf_max=450                      " number of recently opened files
let g:ctrlp_max_files=0                       " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

func! MyPrtMappings()
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<c-t>'],
                \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
                \ }
endfunc

func! MyCtrlPTag()
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
                \ 'AcceptSelection("t")': ['<c-t>'],
                \ }
    CtrlPBufTag
endfunc

let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
com! MyCtrlPTag call MyCtrlPTag()

" Open nerdtree in current dir, write our own custom function because
" NerdTreeToggle just sucks and doesn't work for buffers
function! g:NerdTreeFindToggle()
    if nerdtree#isTreeOpen()
        exec 'NERDTreeClose'
    else
        exec 'NERDTreeFind'
    endif
endfunction

noremap <leader>kb :<C-u>call g:NerdTreeFindToggle()<cr>

map <leader>pi :PluginInstall<cr>

map <leader>: :Tabularize /:<cr>
map <leader>= :Tabularize /=<cr>
map <leader>" :Tabularize /"<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" toggle between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

map <C-N> :call NumberToggle()<cr>

