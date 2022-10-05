#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ip='ip -c'
alias fuck='sudo $(history -p !!)'
alias gaytrix='cmatrix | lolcat'

p_blue="\[\e[36m\]"
p_white="\[\e[0m\]"
p_pink="\[\e[35m\]"
p_green="\[\e[32m\]"

PS1="$p_blue[\h $p_white/ ${p_pink}will]$p_green[\w]$p_white: "
export PATH=$PATH:$(xdg-user-dir BIN)
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin

export SK_NOTEBOOK_DIR="$HOME/documents/notes"
export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
source /usr/share/nvm/init-nvm.sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
