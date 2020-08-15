let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
" let g:indent_guides_color_change_percent = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   guibg=#2c3038 ctermbg=242
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  guibg=#2c323c ctermbg=240
