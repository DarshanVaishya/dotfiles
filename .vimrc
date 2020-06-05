" ######################################################
" ################## VUNDLE ############################
" ######################################################
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ######################################################
" ################## END ###############################
" ######################################################

syntax enable					" Enables syntax highlight
set wrap!						" Disables text wrap
set hlsearch					" Highlights all matches from search
set number relativenumber		" Relate numbers
set nu rnu						" Relative numbering
set autoindent					" Enables auto indent
set encoding=utf-8				" UTF-8 encoding
set tabstop=4					" Set tab to put 4 spaces
set shiftwidth=4				" makes < and > use 4 spaces
set path+=**					" Adds paths for :find command

" Shortcut for find and replace
nnoremap S :%s//g<Left><Left>	
" Copy to clipboard
vnoremap <C-c> "+y
" Paste from clipboard
map <C-p> "+p
" Make , leader key
let mapleader =","
" Toggle spell check
map <leader>o :setlocal spell! spelllang=en_us<CR>
" Enables case insensitive search
set ic

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Executes current program
autocmd FileType python   nnoremap <buffer><leader>c :w<CR> :!clear; python3 %:p;<CR>
autocmd FileType c    	  nnoremap <buffer><silent><leader>z :w<CR> :!clear; gcc %; ./a.out<cr>
