set termguicolors

colorscheme hubris

" enable syntax highlighting
syntax enable

" don't show line numbers
set nonumber
set norelativenumber

set ruler

set cursorline

" soft wrap long lines on word boundaries
set wrap linebreak
set breakindent

set splitright

" search incrementally
set incsearch
" search case-sensitively if search string contains uppercase chars
set ignorecase smartcase

" indentation with reasonable defaults
filetype on
set noexpandtab
set tabstop=4 shiftwidth=4 softtabstop=4

" show tabs as ▸ followed by blank space
set list
set listchars=tab:▸\ ,
" wrapping indicators without line numbers
set showbreak=↳

" apply default code styles
call StyleDefault()

" netrw config
" hide netrw banner
let g:netrw_banner=0

" trim trailing whitespace on save
autocmd bufWritePre * %s/\s\+$//e

" enable mouse interaction
set mouse=a
