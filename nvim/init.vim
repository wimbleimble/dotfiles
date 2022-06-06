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
map <leader>r :source $MYVIMRC<cr>

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let plugin_dir = stdpath('config') . '/plugins/'

call plug#begin(stdpath('data').'/plugins'

execute 'source '.fnameescape(plugin_dir.'fzf.vim')
execute 'source '.fnameescape(plugin_dir.'catppuccin.vim')


call plug#end()

execute 'source '.fnameescape(plugin_dir.'catppuccin-config.vim')

