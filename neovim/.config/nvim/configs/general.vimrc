set termguicolors

colorscheme narcissus

" enable syntax highlighting
syntax enable

" don't show line numbers
set nonumber
set norelativenumber

" statusline customization
set statusline=%f
set statusline+=\ %#StatusLineFlag#%h%w%r%* " flags
set statusline+=%#StatusLineModified#%m%* " modified flag
set statusline+=\ %=%c%V\ on\ %l/%L

set nocursorline

" soft wrap long lines on word boundaries, keep continuation lines
" at the same indentation level
set wrap linebreak
set breakindent

" splitting to the left just feels weird
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

" by default don't show leading whitespace (use :ShowIndents to toggle)
set nolist
" show tabs as ▸ followed by blank space
set listchars=tab:▸\ ,
" wrapping indicators since we don't use line numbers
set showbreak=↳

" apply default code styles
StyleDefault

" netrw config
" hide netrw banner
let g:netrw_banner=0

" replace netrw with lf.vim
let g:lf_replace_netrw = 1
let g:lf_map_keys = 0

" trim trailing whitespace on save
augroup user_trim_trailing_whitespace
  autocmd!
  autocmd bufWritePre * %s/\s\+$//e
augroup END

" enable mouse interaction
set mouse=a

" reduce the update time
" this controls the delay before nvim writes its swap file, so be careful
set updatetime=300

" leave some context lines when scrolling on edges of the window
set scrolloff=3

" add additional TODO-style highlights
" credit: user Ralf @
" https://vi.stackexchange.com/questions/19040/add-keywords-to-a-highlight-group
function! s:UpdateTodoKeywords(...)
  let newKeywords = join(a:000, " ")
  let synTodo =
      \ map(
      \   filter(
      \     split(execute("syntax list"), '\n'),
      \     { i,v -> match(v, '^\w*Todo\>') == 0}
      \   ),
      \   {i,v -> substitute(v, ' .*$', '', '')}
      \ )
  for synGrp in synTodo
    execute "syntax keyword " . synGrp . " contained " . newKeywords
  endfor
endfunction

augroup user_todo
  autocmd!
  autocmd Syntax * call <SID>UpdateTodoKeywords("NOTE", "IMPORTANT", "FIXME")
augroup END

" show the sign column all the time so it doesn't jump in and out
set signcolumn=yes

" plugin configuration: netrw
" don't show stuff in the netrw view that we can't do anything about
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'

" plugin configuration: vim-gitgutter
let g:gitgutter_map_keys = 0

" plugin configuration: coc.vim
" having autocomplete suggestions on all the time is annoying and distracting
augroup disable_coc_suggestions
  autocmd!
  autocmd BufEnter * let b:coc_suggest_disable = 1
augroup END
