#! /usr/bin/env bash
setxkbmap gb
nvidia-settings --load-config-only

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xrandr --output DP-0 --primary --right-of HDMI-0 --rate 74.92

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=gtk2

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

exec i3

