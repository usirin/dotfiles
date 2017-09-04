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
call dein#add('dbakker/vim-projectroot')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/gist-vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('itchyny/lightline.vim')
call dein#add('wavded/vim-stylus')
call dein#add('godlygeek/tabular')
call dein#add('kern/vim-es7')
call dein#add('heavenshell/vim-jsdoc')
call dein#add('Raimondi/delimitMate')
call dein#add('zhaocai/GoldenView.Vim')
call dein#add('mhinz/vim-startify')
call dein#add('trevordmiller/nova-vim')
call dein#add('othree/yajs.vim')
call dein#add('othree/es.next.syntax.vim')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('mxw/vim-jsx')
call dein#add('ervandew/supertab')
call dein#add('sheerun/vim-polyglot')
call dein#add('fleischie/vim-styled-components')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('sbdchd/neoformat')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('flazz/vim-colorschemes')
call dein#add('mklabs/split-term.vim')
call dein#add('wellle/targets.vim')
call dein#add('neovim/node-host')
call dein#add('tyru/open-browser.vim')
call dein#add('kannokanno/previm')

call dein#add('prettier/vim-prettier', {
			\ 'build': 'npm install',
			\ 'if': 'executable("npm")',
			\ 'on_i': 1,
			\ 'on_ft': ['javascript', 'javascript.jsx', 'typescript', 'css', 'less', 'scss', 'json']
			\ })

call dein#add('w0rp/ale')

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

" function to load all config files with .vim extension under
" neovim config folder.
function! s:LoadConfigs()
  let paths = split(glob('$DOTFILES/nvim/*.vim'), "\n")
  call filter(paths, 'v:val !~ "init.vim"')

  for path in paths
    exe 'source ' . path
  endfor
endfunc

" load all config nvim configuration files
call s:LoadConfigs()

" whenever a config file changes, source config.
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $DOTFILES/nvim/*.vim nested source $MYVIMRC
augroup END


