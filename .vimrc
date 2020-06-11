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
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ######################################################
" ################## END ###############################
" ######################################################

syntax enable					" Enables syntax highlight
set wrap!						" Disables text wrap
set number relativenumber		" Relate numbers
set nu rnu						" Relative numbering
set autoindent					" Enables auto indent
set encoding=utf-8				" UTF-8 encoding
set tabstop=4					" Set tab to put 4 spaces
set shiftwidth=4				" makes < and > use 4 spaces
set path+=**					" Adds paths for :find command
set splitbelow					" New file is at bottom when horizontally split
set splitright					" New file is at right when vertically split
set ignorecase					" Ignores case during search
set wildmode=longest,list,full  " Shows all possiblities when using tab completion in vim

" Shortcut for find and replace
nnoremap S :%s//g<Left><Left>	
" Copy to clipboard
vnoremap <C-c> "+y
" Paste from clipboard
map <C-p> "+p
" Make , leader key
let mapleader =" "
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
autocmd FileType python   nnoremap <buffer><leader>z :w<CR> :!clear; python3 %:p<CR>
autocmd FileType c    	  nnoremap <buffer><silent>z :w<CR> :!clear; gcc %; ./a.out<cr>

" Auto comment code
autocmd FileType python   vnoremap <buffer><leader>c :norm I# <CR>
autocmd FileType c    	  vnoremap <buffer><silent>c :norm I// <CR>

" Delete comment
autocmd FileType python   vnoremap <buffer><leader>d :norm 0xx<CR>
autocmd FileType c    	  vnoremap <buffer><silent>d :norm 0xxx<CR>


" Closes the autocomplete tab for YCM onces we are done
let g:ycm_autoclose_preview_window_after_completion=1
" <leader>g to go to defination
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Toggle nerdtree with <leader>n
nnoremap <leader>n :NERDTreeToggle<CR>

" Toggle hlsearch
nnoremap <leader>h :set hlsearch!<CR>
" Toggle ignore case
nnoremap <leader>i :set ignorecase!<CR>
