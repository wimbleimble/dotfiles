#! /usr/bin/env bash
setxkbmap gb
nvidia-settings --load-config-only

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GTK_THEME=Catppuccin-Mocha-Standard-Mauve-Dark
export QT_QPA_PLATFORMTHEME=gtk2
export LM_LICENSE_FILE=/home/kate/downloads/LR-099948_License.dat

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

export MOZ_USE_XINPUT2=1

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

exec i3

