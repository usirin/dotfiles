set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'kchmck/vim-coffee-script'

" Bundles
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-surround'
Bundle 'jlangston/tomorrow-night-vim'
Bundle 'fatih/vim-go'
:silent! :colorscheme tomorrow-night

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'bling/vim-airline'
Bundle 'mattn/emmet-vim'
Bundle 'godlygeek/tabular'

filetype plugin indent on

""""""""""""""""""
"" LOW LEVEL SETUP
""""""""""""""""""

syntax enable
let mapleader=","
let &t_Co=256

"""""""""""""""""""
"" HIGH LEVEL SETUP
"""""""""""""""""""
set noerrorbells " No beeps
set number
set backspace=indent,eol,start
set showcmd
set showmode

set noswapfile
set nobackup
set splitright
set splitbelow

set ignorecase
set incsearch
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set nofoldenable  " disable folding
set expandtab
set tabstop=2
set shiftwidth=2
set list listchars=tab:\ \ ,trail:· " highlight tailing whitespace

" use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" set status bar to be shown all the time
" and format it
set laststatus=2
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

set smartcase
set gdefault
set showmatch

set autoread

" Make handling Vim windows easier
imap <c-c> <esc>
map <leader>w- <c-w>- " smaller
map <leader>w+ <c-w>+ " larger
map <leader>w[ <c-w>= " equal
map <leader>w] <c-w>_ " fill screen
map <leader>>  <c-w>> " vertical expand
map <leader><  <c-w>< " vertical smaller
" map <C-w> <C-o><C-w>
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" make splitting vim windows easier
map <leader>; <c-w>s
map <leader>` <c-w>v<c-w><c-w>
map <leader>y :CtrlPBuffer<cr>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>kb :NERDTreeToggle<cr>
map <leader>bi :BundleInstall<cr>
map <leader>so :so ~/.vimrc<cr>
map <leader>j :!clear; jasmine-node --coffee --verbose %<cr>

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

map <Leader>e :Tabularize /=<cr>
map <Leader>c :Tabularize /:<cr>
map <Leader>es :Tabularize /=\zs<cr>
map <Leader>cs :Tabularize /:\zs<cr>

" Bundle settings
let g:ctrlp_max_height=30
let g:go_disable_autoinstall=1

" lets make sure we don't show these files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" Test helpers from Gary Bernhardt's screen cast:
" https://www.destroyallsoftware.com/screencasts/catalog/file-navigation-in-vim
" https://www.destroyallsoftware.com/file-navigation-in-vim.html
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!time rspec " . a:filename
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>m :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>a :call RunNearestTest()<cr>
" Run all test files
map <leader>rt :call RunTests('spec')<cr>
"
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
