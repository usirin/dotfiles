call vimfiler#custom#profile('default', 'context', {
\   'explorer' : 1,
\   'safe': 0
\ })

nnoremap <leader>kb :VimFilerBufferDir -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<cr>

