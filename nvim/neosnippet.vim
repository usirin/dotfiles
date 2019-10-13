let g:neosnippet#snippets_directory='~/dotfiles/nvim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
