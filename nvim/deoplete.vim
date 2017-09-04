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
