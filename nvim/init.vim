"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/dein/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" deoplete.nvim Related ----------------------------

function! InitDeoplete()
  let g:deoplete#sources = get(g:,'deoplete#sources',{})
  let g:deoplete#_context = get(g:,'deoplete#_context',{})
  let g:deoplete# = get(g:,'deoplete#_context',{})
  
  
  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  " Use smartcase.
  let g:deoplete#enable_smart_case = 1
  
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
  
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>deoplete_cr_fn()<CR>
  function! s:deoplete_cr_fn() abort
    return deoplete#close_popup() . "\<CR>"
  endfunction
  
  " make deoplete work with neosnippet
  " I want to use my tab more smarter. If we are inside a completion menu jump
  " to the next item. Otherwise check if there is any snippet to expand, if yes
  " expand it. Also if inside a snippet and we need to jump tab jumps. If none
  " of the above matches we just call our usual 'tab'.
  let g:deoplete#ignore_sources = {}
  let g:deoplete#ignore_sources._ = ["neosnippet"]
  function! s:neosnippet_complete()
    if pumvisibale()
      return "\<c-n>"
    else
      if neosnippet#expandable_or_jumpable()
        return "\<Plug>(neosnippet_expand_or_jump)"
      endif
      return "\<tab>"
    endif
  endfunction
  
  function! s:my_neosnippet_expand()
    if neosnippet#expandable_or_jumpable()
      return "\<Plug>(neosnippet_expand_or_jump)"
    endif
    return "\<c-tab>"
  endfunction
  
  imap <expr><TAB> <SID>neosnippet_complete()
  imap <expr><C-TAB> <SID>my_neosnippet_expand()

endfunction

call dein#add('Shougo/deoplete.nvim', {
  \ 'hook-post-source': function('InitDeoplete')
  \ })
" End deoplete.nvim Related ------------------------

call dein#add('Shougo/vimfiler.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-markdown')
call dein#add('tpope/vim-surround')
call dein#add('airblade/vim-gitgutter')
call dein#add('flazz/vim-colorschemes')
call dein#add('kchmck/vim-coffee-script')
call dein#add('mxw/vim-jsx')
call dein#add('mtscout6/vim-cjsx')
call dein#add('dbakker/vim-projectroot')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/gist-vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('wavded/vim-stylus')
call dein#add('godlygeek/tabular')
call dein#add('kern/vim-es7')
call dein#add('gavocanov/vim-js-indent')
call dein#add('fatih/vim-go')
call dein#add('heavenshell/vim-jsdoc')
call dein#add('Raimondi/delimitMate')
call dein#add('zhaocai/GoldenView.Vim')
call dein#add('JulesWang/css.vim')
call dein#add('jreybert/vimagit')
call dein#add('mhinz/vim-startify')
call dein#add('terryma/vim-expand-region')
call dein#add('Yggdroot/indentLine')
call dein#add('evanmiller/nginx-vim-syntax')
call dein#add('christoomey/vim-tmux-runner')
call dein#add('janko-m/vim-test')
call dein#add('ap/vim-css-color')

call dein#add('ternjs/tern_for_vim', {
			\ 'build': 'npm install',
			\ 'if': 'executable("npm")',
			\ 'on_i': 1,
			\ 'on_ft': 'javascript'
			\ })

call dein#add('NLKNguyen/papercolor-theme')

" Unite
call dein#add('Shougo/unite.vim')
call dein#add('vim-scripts/unite-colorscheme')
call dein#add('sgur/unite-everything')
call dein#add('Shougo/neomru.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" Basic Configuration --------------------------
let g:goldenview__enable_default_mapping = 0
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

set scrolloff=5

set laststatus=2
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)


" highlight trailing whitespace
set list listchars=tab:\ \ ,trail:·,nbsp:·
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store,*/node_modules/*
set timeout timeoutlen=500 ttimeoutlen=1

" Show a line cursor while you're in insert mode.
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Enable true color support so that we can see colors awesome.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set context to current file's directory
autocmd BufEnter * silent! lcd %:p:h

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e


" End Basic Configuration ----------------------

" Color scheme configuration -------------------

let g:PaperColor_Dark_Override = {
  \ 'background': '#212121',
  \ 'cursorline': '#313131',
  \ 'matchparen': '#4a4a4a',
  \ 'comment': '#5a5a5a'
  \ }

colorscheme solarized
set bg=dark

" show only an underline behind the matched words
hi Search ctermbg=NONE ctermfg=NONE cterm=underline
hi Search guibg=NONE guifg=NONE gui=underline

" File specific color columns
autocmd BufNewFile,BufReadPost *.coffee setl colorcolumn=80
autocmd BufNewFile,BufReadPost *.styl,*.stylus setl colorcolumn=28

" End of Color scheme configuration ------------

" Basic Keybindings ----------------------------
let mapleader=","

" Feel like pro and don't use esc to get out of insert mode
inoremap jj <C-c>

" Even more pro by using jj to get out of terminal mode \o/
tnoremap jj <C-\><C-n>

" No need to press shift to enter command mode.
nnoremap ; :

" add an empty line below and move cursor to the beginning.
nnoremap <Enter> o<Esc>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<cr>

" Shortcut for :b# (switch to alternate buffer)
nnoremap <leader><leader> <c-^>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vs $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Use space for space in normal mode
nmap <space> i<space><C-c>l

" Better split switching
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" nvim sends a backspace character for <c-h>
if has('nvim')
  nmap <BS> <C-W>h
endif

" Better split opening
nnoremap <bar> :vsp<cr>
nnoremap _ :sp<cr>

" create a new tab easily
nnoremap tt :tabe<cr>:Startify<cr>

" navigation between tabs
nnoremap t[ :tabprev<cr>
nnoremap t] :tabnext<cr>

" comment with same keys for both normal and visual mode
nmap <leader>a gcc
vmap <leader>a gc

nnoremap <C-F>h :vert help<space>

" End Basic Keybindings ------------------------


" Unite Preferences ----------------------------

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_data_directory = expand("~/.cache/unite")
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '-i --vimgrep --hidden --ignore ' .
      \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''

let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']

nnoremap <C-f>f :UniteWithProjectDir -direction=botright grep:!<cr>
nnoremap <C-f>a :<C-u>UniteWithProjectDir -no-split -buffer-name=grep -start-insert grep:!<cr>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>p :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -quick-match -buffer-name=buffer  buffer<cr>
nnoremap <leader>cs :<C-u>Unite -no-split -buffer-name=colorschemes colorscheme -auto-preview<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('right')
endfunction

" End Unite Preferences ------------------------


" CtrlP Preferences ----------------------------
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<c-p>'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Use caching and make sure cache is not cleared.
" To be able to manually clear the cache, just press <F5> in CtrlP window.
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0

" Hello
let g:ctrlp_max_files = 0

" <c-z> will mark files for multiple selection
" <c-o> will open them
" j: will jump to the first opened file
" v: will each selected file in a vertical split
" r: will open the first file in current window, and rest will be splitted to
" vertical splits.
let g:ctrlp_open_multiple_files = 'vjr'

let g:ctrlp_line_prefix = '❯  '

let g:ctrlp_mruf_max = 250
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*|.*/node_modules/.*'

let g:ctrlp_prompt_mappings = { 'ToggleMRURelative()': ['<F6>'] }

" jump to file if it's open in the current tab when <cr> pressed
" jump to file if it's open in another tab when <c-t> pressed
let g:ctrlp_switch_buffer = 'et'

" open a new tab right after current one.
let g:ctrlp_tabpage_position = 'ac'

" End CtrlP Preferences ----------------------------


" VimFiler Preferences ----------------------------

call vimfiler#custom#profile('default', 'context', {
\   'explorer' : 1,
\   'safe': 0
\ })
nnoremap <leader>kb :VimFilerBufferDir -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<cr>

" End VimFiler Preferences ------------------------


" Coffee Script Related ----------------------------
" let coffee_compiler = '~/.nvm/v0.10.40/bin/cjsx'
" End Coffee Script Related ------------------------


" Gist.vim Related ----------------------------

" show private gists on list
let g:gist_show_privates = 1

" save gist privately by default
let g:gist_post_private = 1

" only doing :w! will update the gist on remote
let g:gist_update_on_write = 2

" End Gist.vim Related ------------------------


" Tabularize Related ----------------------------

map <leader>: :Tabularize /:<cr>
map <leader>= :Tabularize /=<cr>
map <leader>" :Tabularize /"<cr>

" End Tabularize Related ------------------------


" JsDoc Related ---------------------------------

let g:jsdoc_additional_descriptions=0
let g:jsdoc_input_description=1
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_return=1
let g:jsdoc_return_type=1
let g:jsdoc_return_description=1
let g:jsdoc_access_descriptions=2
let g:jsdoc_underscore_private=1
let g:jsdoc_param_description_separator=' - '
let g:jsdoc_enable_es6=1

" End JsDoc Related -----------------------------


" GoldenView Related ----------------------------


" 1. split to tiled windows
nmap <silent> <C-g><C-g> :GoldenViewResize<cr>

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <C-g>m   <Plug>GoldenViewSwitchMain
nmap <silent> <C-g>t <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <silent> <C-g>n  <Plug>GoldenViewNext
nmap <silent> <C-g>N  <Plug>GoldenViewPrevious

" End GoldenView Related ------------------------



" Lightline related --------------------------------

let g:lightline = {
    \ 'colorscheme': 'Tomorrow_Night',
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive',
    \   'filename': 'LightLineFilename'
    \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'filetype' ] ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'filename', 'fugitive' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ]
    \ }
    \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction
function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
  \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
  \  &ft == 'unite' ? unite#get_status_string() :
  \  &ft == 'vimshell' ? vimshell#get_status_string() :
  \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
  \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
function! LightLineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    return fugitive#head()
  endif
  return ''
endfunction
" End Lightline related ----------------------------

" Autocmd functions "

augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" vim-expand-region Preferences -------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" End vim-expand-region Preferences ---------------

" indentLine preferences
let g:indentLine_loaded = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceChar = '·'
" end of indentLine

" vim-test
let test#strategy = 'vtr'
let test#filename_modifier = ":~"

let test#javascript#mocha#file_pattern = 'test/*.js'
let test#javascript#mocha#executable = 'mocha --reporter spec --compilers js:babel-register'

nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>j :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>

nmap <C-t> :VtrFocusRunner<cr>
" !vim-test
