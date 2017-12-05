if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" function to load all config files with .vim extension under
" neovim config folder.
function! s:LoadConfigs()
  source ~/dotfiles/nvim/dein.vim

  source ~/dotfiles/nvim/general.vim
  source ~/dotfiles/nvim/colorscheme.vim

  source ~/dotfiles/nvim/autocomplete.vim

  source ~/dotfiles/nvim/ale.vim
  source ~/dotfiles/nvim/coffeescript.vim
  source ~/dotfiles/nvim/denite.vim
  source ~/dotfiles/nvim/fzf.vim
  source ~/dotfiles/nvim/gist.vim
  source ~/dotfiles/nvim/jsdoc.vim
  source ~/dotfiles/nvim/lightline.vim
  source ~/dotfiles/nvim/prettier.vim
  source ~/dotfiles/nvim/previm.vim
  source ~/dotfiles/nvim/sneak.vim
  source ~/dotfiles/nvim/vimfiler.vim
  source ~/dotfiles/nvim/remaps.vim

  " Required:
  filetype plugin indent on

  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif
endfunc

" load all config nvim configuration files
call s:LoadConfigs()

" whenever a config file changes, source config.
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $DOTFILES/nvim/*.vim nested source $MYVIMRC
augroup END
