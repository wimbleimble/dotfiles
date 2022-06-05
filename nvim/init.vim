"-------------------------------------------------------------------------------
" General Settings
"-------------------------------------------------------------------------------

set shiftwidth=4
set tabstop=4
set hidden
"set signcolumn=yes:2
set relativenumber
set number
set mouse=a
set scrolloff=8
set termguicolors

"-------------------------------------------------------------------------------
" Key Bindings
"-------------------------------------------------------------------------------

let mapleader = "\<space>"

map gf :edit <cfile><cr>

map <leader>x :!xdg-open %<cr><cr>
map <leader>r :source ~/.config/nvim/init.vim<cr>

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/catppuccin.vim


call plug#end()

source ~/.config/nvim/plugins/catppuccin-config.vim

