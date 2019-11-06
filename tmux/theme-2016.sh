######################
### DESIGN CHANGES ###
######################

# panes
set -g pane-border-fg black
set -g pane-active-border-fg brightyellow

## Status bar design
# status line
# set -g status-utf8 on
set -g status-justify left
set -g status-bg default
set -g status-fg colour12
set -g status-interval 2

set -g message-command-fg blue
set -g message-command-bg black

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none


# The modes {
setw -g clock-mode-colour colour135
setw -g mode-attr bold
setw -g mode-fg magenta
setw -g mode-bg colour254

# }
# The statusbar {


# umut_battery_perc="#(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $2 }')"
setw -g window-status-current-fg colour81
setw -g window-status-current-bg brightmagenta
setw -g window-status-current-attr bold
setw -g window-status-current-format ' #[fg=white]#I:#[fg=black]#W#[fg=white]#F '

setw -g window-status-fg colour80
setw -g window-status-bg default
setw -g window-status-attr none
setw -g window-status-format ' #[fg=colour244]#I#[fg=colour237]:#[fg=colour244]#W#[fg=colour244]#F '

setw -g window-status-bell-attr bold
setw -g window-status-bell-fg colour255
setw -g window-status-bell-bg colour1

# }
tm_session_name="#[bg=magenta,fg=black] ❯ #S ❮ "

set -g status-position bottom
set -g status-bg colour232
set -g status-fg colour51
# set -g status-attr dim
set -g status-left "$tm_session_name"
set -g status-right "#[bg=yellow,fg=black] #{battery_percentage} #[bg=magenta,fg=black] %A | %h-%d | %H:%M "
set -g status-left-length 20

tmux_atom_dark_color="#282c34"

set -g default-terminal "xterm-256color"
# set -g default-terminal "screen-256color"
set -ga terminal-overrides ",xterm-256color:Tc"
set -g pane-border-style "fg=#515969,bg=$tmux_atom_dark_color"
set -g pane-active-border-style "fg=magenta,bg=$tmux_atom_dark_color"
set -g message-style "fg=magenta,bg=$tmux_atom_dark_color"
set -g clock-mode-colour cyan
