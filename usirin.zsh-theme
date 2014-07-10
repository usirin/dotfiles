local ret_status="%(?:%{$fg_bold[red]%}❯ :%{$fg_bold[red]%}❯ %s)"
PROMPT='%{$fg[yellow]%}%~$(git_prompt_info) % %{$reset_color%}${ret_status}%{$fg[green]%}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}:%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓"
