"dein Scripts-----------------------------

" Required:
call dein#begin(expand('~/.config/nvim/dein/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/vimfiler.vim')
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})


call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-markdown')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-obsession')

call dein#add('airblade/vim-gitgutter')
call dein#add('dbakker/vim-projectroot')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/gist-vim')
call dein#add('itchyny/lightline.vim')
call dein#add('maximbaz/lightline-ale')
call dein#add('godlygeek/tabular')
call dein#add('Raimondi/delimitMate')
call dein#add('zhaocai/GoldenView.Vim')
call dein#add('mhinz/vim-startify')
call dein#add('sheerun/vim-polyglot')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('mklabs/split-term.vim')
call dein#add('wellle/targets.vim')
call dein#add('neovim/node-host')
call dein#add('mattn/emmet-vim')
call dein#add('justinmk/vim-sneak')
call dein#add('w0rp/ale')
call dein#add('vim-scripts/bnf.vim')

call dein#add('jxnblk/vim-mdx-js')

call dein#add('fleischie/vim-styled-components')
call dein#add('neoclide/vim-jsx-improve')
call dein#add('jparise/vim-graphql')

call dein#add('prettier/vim-prettier', {
			\ 'build': 'npm install',
			\ 'if': 'executable("npm")',
			\ 'on_i': 1,
			\ 'on_ft': ['javascript', 'javascript.jsx', 'typescript', 'css', 'less', 'scss', 'json']
			\ })

call dein#add('autozimu/LanguageClient-neovim', {
      \ 'rev': 'next',
      \ 'build': 'bash install.sh',
      \ })

call dein#add('reasonml-editor/vim-reason-plus')

call dein#add('rust-lang/rust.vim')

call dein#add('mrk21/yaml-vim')

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('neoclide/macnote.vim')

call dein#add('joshdick/onedark.vim')

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')


" Required:
call dein#end()

" End dein Scripts-------------------------
