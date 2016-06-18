gdiff() { git diff --color "$@" }

sdiff() { svn diff "$@" | view - }

portlist() { sudo lsof -i :"$@" }

kdbe() { ./configure && ./go/build.sh && supervisorctl reload }

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc


