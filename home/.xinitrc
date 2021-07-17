setxkbmap gb

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=gtk2

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

exec i3
