" Auto install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'								" Nerd tree
Plug 'ap/vim-css-color'									" CSS color
Plug 'neoclide/coc.nvim', {'branch': 'release'}			" Intellisense with CoC
call plug#end()


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
set wildmode=longest,list,full  " Shows all possibilities when using tab completion in vim

" Shortcut for find and replace
nnoremap S :%s/
" Copy to clipboard
vnoremap <C-c> "+y
" Paste from clipboard
map <C-p> "+p
" Sets leader key as space
let mapleader =" "
" Toggle spell check
map <leader>o :setlocal spell! spelllang=en_us<CR>
" Enables case insensitive search
set ic

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Executes current program
" autocmd FileType python   nnoremap <buffer><leader>z :w<CR> :!clear; python3 "%:p"<CR>
autocmd FileType python   nnoremap <buffer><leader>z :!clear; python3 "%:p"<CR>
autocmd FileType c    	  nnoremap <buffer><leader>z :w<CR> :!clear; gcc "%:p" && ./a.out<cr>

" Auto comment code
autocmd FileType python   vnoremap <buffer><leader>c :norm ^i# <CR>
autocmd FileType conf     vnoremap <buffer><leader>c :norm ^i# <CR>
autocmd FileType c    	  vnoremap <buffer><leader>c :norm ^i// <CR>

" Delete comment
autocmd FileType python   vnoremap <buffer><leader>d :norm ^xx<CR>
autocmd FileType conf     vnoremap <buffer><leader>d :norm ^xx<CR>
autocmd FileType c    	  vnoremap <buffer><leader>d :norm ^xxx<CR>


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

" nnoremap <leader>y :!grep -oh "https\?://w\{3\}\?\.\?youtub\?e\?\.\S\+" %:p \| xargs mpv
nnoremap <leader>y :!grep -oh "https\?://w\{3\}\?\.\?youtu\S*\.\S\+" %:p \| xargs mpv --no-video<CR>
