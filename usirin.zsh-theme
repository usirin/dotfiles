local ret_status="%(?:%{$fg_bold[green]%}❯ :%{$fg_bold[green]%}❯ %s)"
PROMPT='%{$fg[white]%}%~$(git_prompt_info) % %{$reset_color%}${ret_status}%{$fg[green]%}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}:%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[blue]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[white]%}✓"
