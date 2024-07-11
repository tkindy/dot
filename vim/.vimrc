set autoindent
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set textwidth=80
set ruler

set spelllang=en

" Absolute numbers on cursor line, relative elsewhere
set relativenumber
set number

set undodir=~/.vim/undo/
set undofile

set mouse=a

" Plugins

call plug#begin('~/.vim/plugged')
source ~/.config/vim/plugins.vimrc
call plug#end()
