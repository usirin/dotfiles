######################
### DESIGN CHANGES ###
######################

## Status bar design
# status line
# set -g status-utf8 on
set -g status-justify left
set -g status-style bg=default,fg=colour12
set -g status-interval 2

set -g message-command-style fg=blue,bg=black

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none


# The modes {
setw -g clock-mode-colour colour135
setw -g mode-style fg=magenta,bg=colour254,bold

# }
# The statusbar {


# umut_battery_perc="#(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $2 }')"
setw -g window-status-current-style fg=colour81,bg=brightmagenta,bold
setw -g window-status-current-format ' #[fg=white]#I:#[fg=black]#W#[fg=white]#F '

setw -g window-status-style fg=colour80,bg=default,none
setw -g window-status-format ' #[fg=colour244]#I#[fg=colour237]:#[fg=colour244]#W#[fg=colour244]#F '

setw -g window-status-bell-style bg=colour1,fg=colour255,bold

# }
tm_session_name="#[bg=magenta,fg=black] ❯ #S ❮ "
tm_battery_percentage="#[bg=yellow,fg=black] #{battery_percentage}"

set -g status-position bottom
set -g status-style fg=colour51,bg=colour232,dim
# set -g status-attr dim
set -g status-left "$tm_session_name"
set -g status-right "#[bg=magenta,fg=black] %A | %h-%d | %H:%M "
set -g status-left-length 20

tmux_atom_dark_color="#282c34"

set -g default-terminal "xterm-256color"
# set -g default-terminal "screen-256color"
set -ga terminal-overrides ",xterm-256color:Tc"
set -g pane-border-style "fg=#515969,bg=$tmux_atom_dark_color"
set -g pane-active-border-style "fg=magenta,bg=$tmux_atom_dark_color"
set -g message-style "fg=magenta,bg=$tmux_atom_dark_color"
set -g clock-mode-colour cyan
