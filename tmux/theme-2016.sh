######################
### DESIGN CHANGES ###
######################

## Status bar design
# status line
# set -g status-utf8 on
set -g status-justify left
set -g status-style bg=brightblack,fg=green
set -g status-interval 2

set -g message-command-style fg=blue,bg=black

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

setw -g clock-mode-colour colour135
# setw -g mode-style fg=magenta,bg=colour254,bold

# umut_battery_perc="#(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $2 }')"
setw -g window-status-current-style fg=black,bg=brightmagenta,bold
setw -g window-status-current-format ' #[fg=white]#I:#[fg=black]#W#[fg=white]#F '

setw -g window-status-format ' #I:#W#F '
setw -g window-status-bell-style bg=colour1,fg=colour255,bold

tm_session_name="#[bg=magenta,fg=black] ❯ #S ❮ "

set -g status-position bottom
set -g status-left "$tm_session_name"
set -g status-left-length 20
set -g status-right "#[bg=magenta,fg=black] %A | %h-%d | %H:%M "

tmux_atom_dark_color="#282c34"
tmux_gotham_dark_color="#0a0f14"

set -g default-terminal "xterm-256color"
# set -g default-terminal "screen-256color"
set -ga terminal-overrides ",xterm-256color:Tc"
# set -g pane-border-style "fg=#515969,bg=$tmux_atom_dark_color"
# set -g pane-active-border-style "fg=magenta,bg=$tmux_atom_dark_color"
# set -g message-style "fg=magenta,bg=$tmux_atom_dark_color"
set -g pane-border-style "fg=blue,bg=$tmux_gotham_dark_color"
set -g pane-active-border-style "fg=cyan,bg=$tmux_gotham_dark_color"
set -g message-style "fg=blue,bg=$tmux_gotham_dark_color"
set -g clock-mode-colour cyan
