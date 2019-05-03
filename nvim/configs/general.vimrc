set termguicolors

colorscheme hubris
" enable syntax highlighting
syntax enable
" show line numbers
set number
set ruler

set cursorline

" soft wrap long lines on word boundaries
set wrap linebreak nolist
set breakindent

set splitright

" disable highlighting search matches
set nohlsearch
" search case-insensitively
set ignorecase
" search case-sensitively if search string contains uppercase chars
set smartcase

" indentation
filetype on
set noexpandtab
set tabstop=2 shiftwidth=2 softtabstop=2
" indentation language-specifics
autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType groovy setlocal tabstop=4 shiftwidth=4 softtabstop=4

" netrw config
" hide netrw banner
let g:netrw_banner=0

" trim trailing whitespace on save
autocmd bufWritePre * %s/\s\+$//e

