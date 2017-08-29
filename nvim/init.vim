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
call dein#add('Shougo/deoplete.nvim', { 'build': ':UpdateRemotePlugins' })

call dein#add('Shougo/vimfiler.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-markdown')
call dein#add('tpope/vim-surround')
call dein#add('airblade/vim-gitgutter')
call dein#add('kchmck/vim-coffee-script')
call dein#add('jwhitley/vim-literate-coffeescript')
call dein#add('dbakker/vim-projectroot')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/gist-vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('wavded/vim-stylus')
call dein#add('godlygeek/tabular')
call dein#add('kern/vim-es7')
call dein#add('fatih/vim-go')
call dein#add('heavenshell/vim-jsdoc')
call dein#add('Raimondi/delimitMate')
call dein#add('zhaocai/GoldenView.Vim')
call dein#add('JulesWang/css.vim')
call dein#add('mhinz/vim-startify')
call dein#add('Yggdroot/indentLine')
call dein#add('evanmiller/nginx-vim-syntax')
call dein#add('janko-m/vim-test')
call dein#add('trevordmiller/nova-vim')
call dein#add('othree/yajs.vim')
call dein#add('othree/es.next.syntax.vim')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('mxw/vim-jsx')
call dein#add('ervandew/supertab')
call dein#add('davidhalter/jedi-vim')
call dein#add('sheerun/vim-polyglot')
call dein#add('fleischie/vim-styled-components')
call dein#add('sbdchd/neoformat')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('flazz/vim-colorschemes')
call dein#add('mklabs/split-term.vim')
call dein#add('wellle/targets.vim')

call dein#add('prettier/vim-prettier', {
			\ 'build': 'npm install',
			\ 'if': 'executable("npm")',
			\ 'on_i': 1,
			\ 'on_ft': ['javascript', 'javascript.jsx', 'typescript', 'css', 'less', 'scss', 'json']
			\ })

call dein#add('w0rp/ale')
call dein#add('rakr/vim-two-firewatch')

call dein#add('ternjs/tern_for_vim', {
			\ 'build': 'npm install',
			\ 'if': 'executable("npm")',
			\ 'on_i': 1,
			\ 'on_ft': 'javascript.jsx'
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

" End dein Scripts-------------------------


" Basic Configuration --------------------------
let g:goldenview__enable_default_mapping = 0
syntax enable

let g:python3_host_prog='/usr/local/bin/python3'

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
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Enable true color support so that we can see colors awesome.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" persist undos across sessions
try
  set undodir=~/.config/nvim/temp_dirs/undodir
  set undofile
catch
endtry

" set context to current file's directory
autocmd BufEnter * silent! lcd %:p:h

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" let g:notes_directories = ['~/dev/usirin/notes']
nnoremap <tab> zo
nnoremap <s-tab> zc

" Make <C-Ww> to toggle split to maximized
nnoremap <silent> <C-w>w :ZoomWin<CR>

" End Basic Configuration ----------------------

" Color scheme configuration -------------------

colorscheme nova
set bg=dark

" show only an underline behind the matched words
hi Search ctermbg=NONE ctermfg=NONE cterm=underline
hi Search guibg=NONE guifg=NONE gui=underline

" this is to make only numbers colored up
hi CursorLine ctermbg=NONE
hi CursorLine guibg=NONE

" hi ColorColumn ctermbg=DarkGray

" hi Cursor ctermfg=black ctermbg=white cterm=NONE
" hi CursorIM ctermfg=black ctermbg=white cterm=reverse
" hi Visual cterm=NONE ctermbg=0 ctermfg=NONE
" hi Comment cterm=NONE ctermbg=NONE ctermfg=DarkGray

" File specific color columns
autocmd BufNewFile,BufReadPost *.coffee,*.js,*.litcoffee setl colorcolumn=80
autocmd BufNewFile,BufReadPost *.styl,*.stylus setl colorcolumn=28

autocmd FileType java setlocal shiftwidth=4 tabstop=4

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
nmap <silent> <leader>ev :e $MYVIMRC<cr>
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
let g:startify_custom_header = []

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
      \ '--line-numbers --nocolor --vimgrep --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''

let g:unite_source_grep_recursive_opt = ''

let g:unite_source_rec_async_command =
  \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']

nnoremap <C-f>f :UniteWithProjectDir -direction=botright grep:!<cr>
nnoremap <C-f>a :<C-u>UniteWithProjectDir -no-split -buffer-name=grep -start-insert grep:!<cr>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>p :<C-u>Unite -no-split -buffer-name=files     -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>UniteWithProjectDir -no-split -buffer-name=files     -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru       -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline   -start-insert outline<cr>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffer -start-insert buffer<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
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
let g:ctrlp_map = "<C-'>"

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$\|vendor',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Use caching and make sure cache is not cleared.
" To be able to manually clear the cache, just press <F5> in CtrlP window.
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

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
let coffee_compiler = '~/.nvm/v0.10.46/bin/cjsx'
" let coffee_compiler = '/Users/umutsirin/.nvm/versions/node/v6.9.1/bin/coffee'
" let coffee_compiler = '/Users/umutsirin/.nvm/versions/node/v6.9.2/bin/cjsx'

autocmd FileType litcoffee runtime ftplugin/coffee.vim

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

" indentLine preferences
let g:indentLine_loaded = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceChar = '·'
" end of indentLine

" vim-test
let test#strategy = 'neovim'
let test#filename_modifier = ":~"

let test#javascript#mocha#file_pattern = '\vtest\.(js|jsx|coffee)$'
let test#javascript#mocha#executable = 'mocha --reporter spec --compilers js:babel-register'

" vim-jsx
let g:jsx_ext_required = 0

nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>j :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>

" nmap <C-t> :VtrFocusRunner<cr>
" !vim-test
"

" deoplete.nvim Related ----------------------------

" let g:deoplete#sources = get(g:,'deoplete#sources',{})
" let g:deoplete#_context = get(g:,'deoplete#_context',{})
" let g:deoplete# = get(g:,'deoplete#_context',{})


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

" imap <expr><TAB> <SID>neosnippet_complete()
" imap <expr><C-TAB> <SID>my_neosnippet_expand()
inoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"


" End deoplete.nvim Related ------------------------

" Super tab & jedi ----------------------------------------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

autocmd FileType *
\ if &omnifunc != '' |
\   call SuperTabChain(&omnifunc, "<c-p>") |
\ endif

" let g:jedi#use_splits_not_buffers = "right"

" End Super tab ----------------------------------------


" R & Rmd configurations
let r_syntax_folding = 1
"


" vim css-color
nnoremap <leader>ee :call css_color#toggle()<cr>
"

" Prettier
let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#bracket_spacing = 'true'


augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.json PrettierAsync
augroup END
" end Prettier

"
let g:fzf_layout = { 'down': '20%' }

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=* Buffers
  \ call fzf#vim#buffers(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'GitFiles' s:find_git_root()

nnoremap <C-p> :ProjectFiles<cr>

highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_open_list = 0
let g:ale_lint_on_text_changed = 'never'
"
