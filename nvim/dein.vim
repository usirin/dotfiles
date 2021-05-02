" Scripts-----------------------------

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
call dein#add('godlygeek/tabular')
call dein#add('Raimondi/delimitMate')
" call dein#add('zhaocai/GoldenView.Vim')
call dein#add('mhinz/vim-startify')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('mklabs/split-term.vim')
call dein#add('wellle/targets.vim')
call dein#add('neovim/node-host')
call dein#add('mattn/emmet-vim')
call dein#add('justinmk/vim-sneak')

call dein#add('mrk21/yaml-vim')

call dein#add('Shougo/unite.vim')
" call dein#add('Shougo/denite.nvim')

call dein#add('arzg/vim-colors-xcode')
call dein#add('whatyouhide/vim-gotham')

call dein#add('fatih/vim-go')
call dein#add('honza/vim-snippets')

call dein#add('nathanaelkane/vim-indent-guides')
" call dein#add('leafgarland/typescript-vim')
call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('MaxMEllon/vim-jsx-pretty')
" call dein#add('neoclide/vim-jsx-improve')

" call dein#add('jason0x43/vim-js-indent')

call dein#add('jxnblk/vim-mdx-js')
" call dein#add('styled-components/vim-styled-components')
" call dein#add('fleischie/vim-styled-components')
call dein#add('jparise/vim-graphql')


" Required:
call dein#end()

" End dein Scripts-------------------------
