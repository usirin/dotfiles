local new_line=$'\n'

local clr_fire="%{$fg[red]%}"
local clr_bold_fire="%{$fg_bold[red]%}"
local clr_bright_bold_fire="%{$fg_bold[9]%}"
local clr_bg_fire="%{$bg[red]%}"

local clr_shadow="%{$fg[magenta]%}"
local clr_bold_shadow="%{$fg_bold[magenta]%}"
local clr_bg_shadow="%{$bg[magenta]%}"

local clr_blonde="%{$fg[yellow]%}"
local clr_bg_blonde="%{$bg[yellow]%}"
local clr_bold_blonde="%{$fg_bold[142]%}"

local clr_grass="%{$fg[green]%}"
local clr_bg_grass="%{$bg[green]%}"
local clr_bold_grass="%{$fg_bold[green]%}"

local clr_light="%{$fg[magenta]%}"

local prompt_pwd_color=$clr_blonde
# local prompt_git_color=$fg_bold[black]$clr_bg_fire
local prompt_git_color="%{$FG[010]%}"
# local prompt_git_color=$fg[white]$clr_bg_grass
local prompt_prompt_color=$clr_blonde

if [ "$SSH_CONNECTION" ]; then
  prompt_prompt_color=$clr_shadow
fi

local prompt_git_dirty_color=$clr_blonde
local prompt_git_clean_color=$clr_grass

local prompt_git_dirty="✗"
local prompt_git_clean="✓"

local prompt_prompt="❯ "

# borrowed from:
# https://github.com/robbyrussell/oh-my-zsh/blob/b15918d414f255f8d2b36c99a338f930d7431b21/themes/fishy.zsh-theme#L3-L10
_fishy_collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}

local ret_git_dirty="${prompt_git_dirty_color}${prompt_git_dirty}"
local ret_git_clean="${prompt_git_clean_color}${prompt_git_clean}"
local ret_prompt="${prompt_prompt_color}${prompt_prompt}"

ZSH_THEME_GIT_PROMPT_PREFIX="$clr_blonde:%{$reset_color%}${prompt_git_color}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%} ${ret_git_dirty}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%} ${ret_git_clean}%{$reset_color%}"

local _usirin_prompt='${prompt_pwd_color}$(_fishy_collapsed_wd)$(git_prompt_info)% %{$reset_color%}${new_line}${ret_prompt}%{$reset_color%}'

_hostname() {
  hostname
}

if [ "$SSH_CONNECTION" ]; then
  _usirin_prompt="${prompt_prompt_color}$(hostname):${_usirin_prompt}"
fi

PROMPT=$_usirin_prompt
