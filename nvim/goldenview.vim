let g:goldenview__enable_default_mapping = 0

" 1. split to tiled windows
nmap <silent> <C-g><C-g> :GoldenViewResize<cr>

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <C-g>m <Plug>GoldenViewSwitchMain
nmap <silent> <C-g>t <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <silent> <C-g>n  <Plug>GoldenViewNext
nmap <silent> <C-g>N  <Plug>GoldenViewPrevious


