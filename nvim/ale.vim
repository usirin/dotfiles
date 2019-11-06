" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
let g:ale_open_list = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
" Fix JavaScript code with ESlint
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.typescript = ['prettier']
" let g:ale_javascript_eslint_use_global=1

nmap <silent> ]q <Plug>(ale_next_wrap)
nmap <silent> [q <Plug>(ale_previous_wrap)
