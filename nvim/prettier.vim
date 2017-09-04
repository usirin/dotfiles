let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#bracket_spacing = 'true'

augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.json,*.css PrettierAsync
augroup END

