call vimfiler#custom#profile('default', 'context', {
\   'explorer' : 1,
\   'safe': 0
\ })

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '^node_modules$']
let g:vimfiler_tree_opened_icon = "▾"
let g:vimfiler_tree_closed_icon = "▸"
let g:vimfiler_readonly_file_icon = "✗"
let g:vimfiler_marked_file_icon = "✓"

autocmd FileType vimfiler setlocal nonumber

nnoremap <leader>kq <Plug>(vimfiler_hide)


" open a vimfiler buffer automatically when Vim starts up if no
" files(arguments) were specified
" autocmd VimEnter * if !argc() | VimFiler | endif
