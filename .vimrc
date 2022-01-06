" .vimrc for VSCode
syntax enable					" Enables syntax highlight
set wrap!						" Disables text wrap
set autoindent					" Enables auto indent
set encoding=utf-8				" UTF-8 encoding
set tabstop=4					" Set tab to put 4 spaces
set shiftwidth=4				" makes < and > use 4 spaces
set splitbelow					" New file is at bottom when horizontally split
set splitright					" New file is at right when vertically split
set ignorecase
set smartcase					" Case insensitive search if all letters are lower
set wildmode=longest,list,full  " Shows all possibilities when using tab completion in vim
set fileformat=unix				" Sets file format to unix style

command W execute ":w"

" Shortcut for find and replace
nnoremap S :%s/
vnoremap S :s/

" Toggle hlsearch
nnoremap <leader>hl :set hlsearch!<CR>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
