"dein Scripts-----------------------------

" Required:
call dein#begin(expand('~/.config/nvim/dein/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/deoplete.nvim', { 'build': ':UpdateRemotePlugins' })
call dein#add('ervandew/supertab')
call dein#add('neoclide/ultisnips')

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
call dein#add('Raimondi/delimitMate')
call dein#add('zhaocai/GoldenView.Vim')
call dein#add('mhinz/vim-startify')
call dein#add('trevordmiller/nova-vim')
call dein#add('sheerun/vim-polyglot')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('flazz/vim-colorschemes')
call dein#add('mklabs/split-term.vim')
call dein#add('wellle/targets.vim')
call dein#add('neovim/node-host')
call dein#add('tyru/open-browser.vim')
call dein#add('kannokanno/previm')
call dein#add('mattn/emmet-vim')

call dein#add('heavenshell/vim-jsdoc')
call dein#add('fleischie/vim-styled-components')
call dein#add('neoclide/vim-jsx-improve')
call dein#add('jparise/vim-graphql')

call dein#add('ternjs/tern_for_vim', {
      \ 'on_ft': ['javascript', 'javascript.jsx']
      \ })

call dein#add('carlitux/deoplete-ternjs', {
      \ 'on_ft': ['javascript', 'javascript.jsx']
      \ })

call dein#add('othree/jspc.vim', {
      \ 'on_ft': ['javascript', 'javascript.jsx']
      \ })

call dein#add('prettier/vim-prettier', {
			\ 'build': 'npm install',
			\ 'if': 'executable("npm")',
			\ 'on_i': 1,
			\ 'on_ft': ['javascript', 'javascript.jsx', 'typescript', 'css', 'less', 'scss', 'json']
			\ })

call dein#add('w0rp/ale')

call dein#add('justinmk/vim-sneak')

" Unite
call dein#add('Shougo/unite.vim')
call dein#add('vim-scripts/unite-colorscheme')
call dein#add('sgur/unite-everything')
call dein#add('Shougo/neomru.vim')

call dein#add('Shougo/denite.nvim')
call dein#add('nixprime/cpsm')
call dein#add('neoclide/macnote.vim')
call dein#add('chemzqm/denite-extra')


" Required:
call dein#end()

" End dein Scripts-------------------------
