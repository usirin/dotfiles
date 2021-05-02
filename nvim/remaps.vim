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
nnoremap <leader><space> :nohlsearch \| call coc#float#close_all()<CR>

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
nnoremap _ Hmx``<C-w>szz<C-w><C-p>`x``<C-w><C-p>
" nnoremap _ :sp<cr>

" create a new tab easily
nnoremap tt :tabe<cr>:Startify<cr>
" let g:startify_custom_header = []

" navigation between tabs
nnoremap [t :tabprev<cr>
nnoremap t[ :tabprev<cr>
nnoremap ]t :tabnext<cr>
nnoremap t] :tabnext<cr>
nnoremap [T :tabfirst<cr>
nnoremap ]T :tablast<cr>

" comment with same keys for both normal and visual mode
nmap <leader>a gcc
vmap <leader>a gcgv

nnoremap <C-F>h :vert help<space>

" open & close folds with tab & s-tab
" nnoremap <tab> zo
" nnoremap <s-tab> zc

nnoremap <C-p> :ProjectRootExe Files<cr>
nnoremap <C-t> :GFiles<cr>


nnoremap <silent> <C-f>f :<C-u>ProjectRootExe Ag <cr>
vnoremap <silent> <C-f>f y:ProjectRootExe Ag <C-r>=fnameescape(@")<CR><CR>
nnoremap <silent> <leader>b :<C-u>Buffers<cr>

" tabularize
map <leader>: :Tabularize /:<cr>
map <leader>= :Tabularize /=<cr>
map <leader>" :Tabularize /"<cr>

nnoremap <leader>kb :VimFilerBufferDir -buffer-name=explorer -auto-cd -split -winwidth=35 -no-quit<cr>

nnoremap <leader>j :ProjectRootExe Term npx jest --findRelatedTests expand("%:p:h")<cr>

" nmap <leader>rn :call CocAction('rename')<cr>
" nnoremap <leader>rn <Plug>(coc-rename)
nmap <leader>rn <Plug>(coc-rename)
nmap Y y$

nmap <leader>w <Plug>(coc-codeaction)
vmap <leader>w <Plug>(coc-codeaction-selected)
