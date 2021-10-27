" ### Vim-Plug ###
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'							" Footer bar
Plug 'tpope/vim-commentary'								" Auto commentor
Plug 'ap/vim-css-color'									" CSS color
Plug 'morhetz/gruvbox'									" Color scheme
Plug 'mbbill/undotree'
call plug#end()

colorscheme gruvbox
set background=dark

" ################### Vim-Plug end #################### "
syntax enable					" Enables syntax highlight
set wrap!						" Disables text wrap
set tabstop=4					" Set tab to put 4 spaces
set shiftwidth=4				" makes < and > use 4 spaces
set splitbelow					" New file is at bottom when horizontally split
set splitright					" New file is at right when vertically split
set ignorecase                  " Ignores case
set smartcase					" Case insensitive search if all letters are lower
set smartindent
set noerrorbells
set scrolloff=5
set signcolumn=yes              " Side bar to show errors
set encoding=utf-8				" UTF-8 encoding
set termguicolors				" Sets colors according to the theme
set fileformat=unix				" Sets file format to unix style
" set nu rnu                      " relative numbers
" set cursorline
set number
set updatetime=300

command W execute ":w"
" Shortcut for find and replace
nnoremap S :%s/
vnoremap S :s/
" Copy to clipboard
vnoremap <C-c> "+y
" Sets leader key as space
let mapleader =" "

" terminal settings
tnoremap <Esc> <C-\><C-n>
command T execute "sp | resize 15 | terminal"
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

autocmd FileType c   	  nnoremap <buffer><leader>z :!clear; gcc "%:p" && ./a.out<CR>
autocmd FileType cpp   	  nnoremap <buffer><leader>z :!clear; g++ "%:p" && ./a.out<CR>
" autocmd FileType html,htmldjango nnoremap <buffer><leader>z :!xdg-open "%:p"<CR><CR>
autocmd FileType html,htmldjango nnoremap <buffer><leader>z :Bracey<CR>
autocmd FileType python nnoremap <buffer><leader>z :!python3 "%:p"<CR>

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

" Toggle hlsearch
nnoremap <leader>hl :set hlsearch!<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" Comment  and remove comment from code
map <leader>/ gcc<ESC>
let g:airline_theme='gruvbox'

" ### COC SETTINGS ###
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-python',
	\ 'coc-json',
	\ 'coc-sh',
	\ 'coc-clangd',
	\ 'coc-tsserver',
	\ 'coc-html',
	\ 'coc-css'
	\ ]
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-refrences)
nmap <F2> <Plug>(coc-rename)
map <leader><leader> <C-y>,
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <leader>p :Prettier<CR>
