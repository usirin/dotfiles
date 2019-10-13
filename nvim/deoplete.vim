" let g:deoplete#sources = get(g:,'deoplete#sources',{})
" let g:deoplete#_context = get(g:,'deoplete#_context',{})
" let g:deoplete# = get(g:,'deoplete#_context',{})

let g:deoplete#enable_at_startup = 1

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>deoplete_cr_fn()<CR>
function! s:deoplete_cr_fn() abort
  return deoplete#close_popup() . "\<CR>"
endfunction


" call deoplete#custom#option({
" \ 'auto_complete_delay': 200,
" \ 'smart_case': v:true,
" \ })

" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

autocmd FileType *
\ if &omnifunc != '' |
\   call SuperTabChain(&omnifunc, "<c-n>") |
\ endif

" deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
