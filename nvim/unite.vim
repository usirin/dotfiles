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

nnoremap <C-f>f :UniteWithProjectDir -direction=left grep:!<cr>
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


