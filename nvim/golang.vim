let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1

" we want coc.nvim to handle go to def
let g:go_def_mapping_enabled = 0

" augroup golang_bindings
"   autocmd! golang_bindings
"   autocmd Filetype go nmap <buffer> <silent> gf :GoDef<CR>
" augroup end
