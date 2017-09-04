" set context to current file's directory
autocmd BufEnter * silent! lcd %:p:h

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" File specific color columns
autocmd BufNewFile,BufReadPost *.coffee,*.js,*.litcoffee setl colorcolumn=80
autocmd BufNewFile,BufReadPost *.styl,*.stylus setl colorcolumn=28

autocmd FileType java setlocal shiftwidth=4 tabstop=4

autocmd FileType litcoffee runtime ftplugin/coffee.vim

