" ### Vim-Plug ###
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'								" Nerd tree
Plug 'ap/vim-css-color'									" CSS color
Plug 'mbbill/undotree'									" Undotree
" Plug 'kien/ctrlp.vim'									" Fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'								" Git integration
Plug 'vim-airline/vim-airline'							" Footer bar
Plug 'morhetz/gruvbox'									" Color scheme
Plug 'tpope/vim-commentary'								" Auto commentor
call plug#end()

colorscheme gruvbox
set background=dark

" ################### Vim-Plug end #################### " 
syntax enable					" Enables syntax highlight
set wrap!						" Disables text wrap
set nu rnu						" Relative numbering
set autoindent					" Enables auto indent
set encoding=utf-8				" UTF-8 encoding
set tabstop=4					" Set tab to put 4 spaces
set shiftwidth=4				" makes < and > use 4 spaces
set path+=**					" Adds paths for :find command
set splitbelow					" New file is at bottom when horizontally split
set splitright					" New file is at right when vertically split
set ignorecase
set smartcase					" Case insensitive search if all letters are lower
set wildmode=longest,list,full  " Shows all possibilities when using tab completion in vim
set fileformat=unix				" Sets file format to unix style
" set shellcmdflag=-ic

command W execute ":w"
" Nvim enter into insert mode when using :!
autocmd TermOpen term://* startinsert

" Shortcut for find and replace
nnoremap S :%s/
vnoremap S :s/
" Copy to clipboard
vnoremap <C-c> "+y
" Paste from clipboard
" map <C-p> "+p
" Sets leader key as space
let mapleader =" "
" Toggle spell check
map <leader>o :setlocal spell! spelllang=en_us<CR>

"split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Resizing windows
nnoremap <leader>h :vertical resize -5<CR>
nnoremap <leader>l :vertical resize +5<CR>
nnoremap <leader>j :resize -5<CR>
nnoremap <leader>k :resize +5<CR>

" Executes current program
if !empty(glob("./.venv/bin/python3"))
	autocmd FileType python nnoremap <buffer><leader>z :!.venv/bin/python3 "%:p"<CR>
else
	" autocmd FileType python nnoremap <buffer><leader>z :!clear; python3 "%:p"<CR>
	autocmd FileType python nnoremap <buffer><leader>z :!python3 "%:p"<CR>
	autocmd FileType python nnoremap <leader><S-z> :term python3 "%:p"<CR>
endif
autocmd FileType c   	  nnoremap <buffer><leader>z :term gcc "%:p" && ./a.out<CR>
autocmd FileType cpp   	  nnoremap <buffer><leader>z :term g++ "%:p" && ./a.out<CR>
autocmd FileType scheme	  nnoremap <buffer><leader>z :!raco exe -o a.out "%:p" && ./a.out<CR>
autocmd FileType html,htmldjango nnoremap <buffer><leader>z :! xdg-open "%:p"<CR><CR>

" Toggle nerdtree with <leader>n
nnoremap <leader>n :NERDTreeToggle<CR>

" Toggle hlsearch
nnoremap <leader>hl :set hlsearch!<CR>

" nnoremap <leader>y :!grep -oh "https\?://w\{3\}\?\.\?youtu\S*\.\S\+" "%:p" \| shuf \| xargs mpv --no-video<CR>
nnoremap <leader>y :term grep -oh "https\?://w\{3\}\?\.\?youtu\S*\.\S\+" "%:p" \| shuf \| xargs mpv --no-video<CR>

" Show undotree
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>t :!inal<CR>

" FZF shortcuts
nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>

" Comment  and remove comment from code
map <leader>/ gcc<ESC>

" ### COC SETTINGS ###
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-python',
	\ 'coc-json',
	\ 'coc-sh',
	\ 'coc-clangd',
	\ ]
" Select python interpreter in COC
autocmd FileType python nnoremap <leader>ci :CocCommand python.setInterpreter<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-refrences)
nmap <leader>rr <Plug>(coc-rename)
