set autoindent
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
colorscheme slate
set tw=80

set spelllang=en

" Absolute numbers on cursor line, relative elsewhere
set relativenumber
set number

set undodir=~/.config/vim/undo/
set undofile

" Plugins

call plug#begin('~/.vim/plugged')
source ~/.config/vim/plugins.vimrc
call plug#end()

let mapleader="\<Space>"
map <Leader>m <Plug>(easymotion-prefix)

set mouse=a
set clipboard=unnamedplus

