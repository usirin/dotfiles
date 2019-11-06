" general config
let g:ctrlsf_default_root = 'project'

" remaps
nmap     <C-D>f <Plug>CtrlSFPrompt
vmap     <C-D>f <Plug>CtrlSFVwordPath
vmap     <C-D>F <Plug>CtrlSFVwordExec
nmap     <C-D>n <Plug>CtrlSFCwordPath
nmap     <C-D>p <Plug>CtrlSFPwordPath
nnoremap <C-D>o :CtrlSFOpen<CR>
nnoremap <C-D>t :CtrlSFToggle<CR>
inoremap <C-D>t <Esc>:CtrlSFToggle<CR>

