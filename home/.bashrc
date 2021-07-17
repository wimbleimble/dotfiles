#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ip='ip -c'
alias fuck='sudo $(history -p !!)'

p_blue="\[\e[36m\]"
p_white="\[\e[0m\]"
p_pink="\[\e[35m\]"
p_green="\[\e[32m\]"

PS1="$p_blue[\h $p_white/ $p_pink\u]$p_green[\w]$p_white: "
. "$HOME/.cargo/env"
export PATH=$PATH:$(xdg-user-dir BIN)
