set termguicolors

colorscheme narcissus

" enable syntax highlighting
syntax enable

" don't show line numbers
set nonumber
set norelativenumber

" statusline
set statusline=%f
set statusline+=\ %#StatusLineFlag#%h%w%r%* " flags
set statusline+=%#StatusLineModified#%m%* " modified flag
set statusline+=\ %=%c%V\ on\ %l/%L

set cursorline

" soft wrap long lines on word boundaries
set wrap linebreak
set breakindent

set splitright

" search incrementally
set incsearch
" search case-sensitively if search string contains uppercase chars
set ignorecase smartcase

" re-enable search highlighting when starting a new search
augroup user_search_auto_highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
augroup END

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
StyleDefault

" netrw config
" hide netrw banner
let g:netrw_banner=0

" trim trailing whitespace on save
augroup user_trim_trailing_whitespace
  autocmd!
  autocmd bufWritePre * %s/\s\+$//e
augroup END

" enable mouse interaction
set mouse=a
