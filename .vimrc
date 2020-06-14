set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tmsvg/pear-tree'
Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

set laststatus=2
let g:lightline = {'colorscheme': 'solarized'}

set number

set smartcase
set incsearch
set nohlsearch

set spelllang=en,de

set tabstop=2
set shiftwidth=2
set expandtab
