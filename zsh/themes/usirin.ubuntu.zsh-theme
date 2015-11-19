local ret_arrow="%{$fg_bold[magenta]%}❯ "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}:%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$reset_color%}%{$fg[magenta]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$reset_color%}%{$fg[green]%}✓%{$reset_color%}"


PROMPT='%{$fg[white]%}%~$(git_prompt_info) % %{$reset_color%}%{$reset_color%}${ret_arrow}%{$reset_color%}'

