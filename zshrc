# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l='ls -laF'
alias ..='cd ..'
alias ...='cd ../..'
alias gc='git commit'
alias ga='git add'
alias gp='git push'
alias gs='git status'
alias glog="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias r40="rvm gemset use rails4.0"
alias rize="cd ~/ruby/rails/randomize"

# functions
gdiff() { git diff --color "$@" }

sdiff() { svn diff "$@" | view - }

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# for z script, not zsh
. `brew --prefix`/etc/profile.d/z.sh

# GOPATH exportation
export GOPATH=$HOME/gocode

# Customize to your needs...
export PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin

PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:$HOME/gocode/bin

