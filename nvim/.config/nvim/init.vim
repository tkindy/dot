set autoindent
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
colorscheme slate
set tw=80

set spelllang=en

" Absolute numbers on cursor line, relative elsewhere
set relativenumber
set number

" Plugins

call plug#begin('~/.vim/plugged')
source ~/.config/nvim/plugins.vimrc
call plug#end()

set mouse=a
set clipboard=unnamedplus
