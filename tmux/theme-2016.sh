######################
### DESIGN CHANGES ###
######################

# panes
set -g pane-border-fg black
set -g pane-active-border-fg brightred

## Status bar design
# status line
# set -g status-utf8 on
set -g status-justify left
set -g status-bg default
set -g status-fg colour12
set -g status-interval 2

# messaging
set -g message-fg black
set -g message-bg yellow
set -g message-command-fg blue
set -g message-command-bg black

#window mode
setw -g mode-bg colour6
setw -g mode-fg colour0

# Info on left (I don't have a session display for now)
set -g status-left ''

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

set -g default-terminal "screen-256color"

# The modes {
setw -g clock-mode-colour colour135
setw -g mode-attr bold
setw -g mode-fg colour196
setw -g mode-bg colour238

# }
# The panes {

set -g pane-border-bg colour235
set -g pane-border-fg colour238
set -g pane-active-border-bg colour236
set -g pane-active-border-fg colour51

# }
# The statusbar {

tm_icon="♟"
tm_separator_right_thin=" ❯"
tm_separator_left_thin="❮ "
tm_color_music=white
tm_color_feature=red
tm_battery="#[fg=white,bg=colour240,bold] #{battery_percentage} "
tm_date="#[fg=white,bg=red] %m/%d/%Y #[fg=white,bg=magenta,bold] %H:%M:%S"
tm_spotify="#[fg=$tm_color_music,bg=colour246,bold]#(osascript ~/dotfiles/osx/spotify.scpt)"
tm_session_name="#[fg=red]$tm_separator_right_thin #S $tm_separator_left_thin"

umut_battery_perc="#(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $2 }')"
setw -g window-status-current-fg colour81
setw -g window-status-current-bg colour236
setw -g window-status-current-attr bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '

setw -g window-status-fg colour80
setw -g window-status-bg default
setw -g window-status-attr none
setw -g window-status-format ' #[fg=colour244]#I#[fg=colour237]:#[fg=colour244]#W#[fg=colour244]#F '

setw -g window-status-bell-attr bold
setw -g window-status-bell-fg colour255
setw -g window-status-bell-bg colour1

# }
# The messages {

set -g message-attr bold
set -g message-fg white
set -g message-bg default

# }

set -g status-position bottom
set -g status-bg colour234
set -g status-fg colour51
set -g status-attr dim
set -g status-left "$tm_session_name"
set -g status-right "#[fg=red]%A | %h-%d | %H:%M "
# set -g status-right $tm_battery'|'$tm_date' '$tm_spotify
# set -g status-right-length 100
set -g status-left-length 20

set -g default-terminal "xterm-256color"
set -ga terminal-overrides ",xterm-256color:Tc"
set -g pane-border-style 'fg=brightblack,bg=black'
set -g pane-active-border-style 'fg=brightwhite,bg=black'
set -g message-style 'fg=cyan, bg=black'
set -g clock-mode-colour cyan
