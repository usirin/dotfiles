let g:LanguageClient_changeThrottle = 0.5

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['node', '/Users/umut.sirin/.nvm/versions/node/v10.15.3/bin/javascript-typescript-stdio', '-l', '~/.LSP-log'],
    \ 'typescript.jsx': ['node', '/Users/umut.sirin/.nvm/versions/node/v10.15.3/bin/javascript-typescript-stdio', '-l', '~/.LSP-log'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['pyls'],
    \ }

" autocmd FileType javascript.jsx nnoremap <buffer>
"   \ gf :call LanguageClient_textDocument_definition()<cr>

" autocmd FileType javascript.jsx nnoremap <buffer>
"   \ gH :call LanguageClient_textDocument_hover()<cr>

" autocmd FileType javascript.jsx nnoremap <buffer>
"   \ gR :call LanguageClient_textDocument_rename()<cr>

autocmd FileType javascript.jsx setlocal signcolumn=yes
autocmd FileType typescript.jsx setlocal signcolumn=yes
autocmd FileType javascript setlocal signcolumn=yes
autocmd FileType typescript setlocal signcolumn=yes

augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END
