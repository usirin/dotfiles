# git related shell aliases
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# echo out the branch name, useful for plugins, keybindings for vim, etc.
# (g)it(b)ranch(n)ame
alias gbn="git rev-parse --abbrev-ref HEAD"

 # cd into git root from anywhere in the version controlled folder.
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

alias git-undo="git reset --soft HEAD~1"

# if a parameter is supplied use it as upstream name for each submodule if not
# default it to origin.
function sub-pull() {
  if [[ $# > 0 ]]; then
    git submodule foreach git pull $@ master
  else
    git submodule foreach git pull origin master
  fi
}
