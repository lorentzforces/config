call plug#begin()

Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'

call plug#end()

set termguicolors

" enable syntax highlighting
syntax enable
" show line numbers
set number

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" disable highlighting search matches
set nohlsearch
" search case-insensitively
set ignorecase
" search case-sensitively if search string contains uppercase chars
set smartcase

" indentation
filetype on
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

set ruler

" language-specifics: java
autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4

" language-specifics: groovy
autocmd FileType groovy setlocal tabstop=4 shiftwidth=4 softtabstop=4

" netrw config
" hide netrw banner
let g:netrw_banner=0

" trim trailing whitespace on save
autocmd bufWritePre * %s/\s\+$//e
