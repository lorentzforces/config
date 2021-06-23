let mapleader = "\<SPACE>"

nnoremap <leader><leader> :Files<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>g :Rg<SPACE>
nnoremap <leader>b :Buffers<CR>

" tab navigation
nnoremap <silent> <leader>c :tabnew<CR>
nnoremap <silent> <leader>p :tabprevious<CR>
nnoremap <silent> <leader>n :tabnext<CR>
nnoremap <silent> <leader>P :tabmove -<CR>
nnoremap <silent> <leader>N :tabmove +<CR>

" window navigation
nnoremap <silent> <leader>- :sp<CR>
nnoremap <silent> <leader>\| :vsp<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L

nnoremap <silent> <leader>x :q<CR>

" vim only lets you increase and decrease the size of the split, it doesn't
" let you change in a specific direction
nnoremap <leader><M-h> <C-w><
nnoremap <leader><M-l> <C-w>>

nnoremap <leader><M-k> <C-w>+
nnoremap <leader><M-j> <C-w>-

nnoremap <silent> <leader>s :set hlsearch!<CR>

" ctrl-escape exits terminal mode
tnoremap <C-Esc> <C-\><C-n>

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ability to insert blank lines without entering insert mode
nnoremap <silent> <C-j> o<Esc>gk
nnoremap <silent> <C-k> O<Esc>gj

" easy line duplication
nnoremap <silent> <leader>d :t.<CR>

" plugin keybinds for coc.vim
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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>a <Plug>(coc-codeaction)
inoremap <silent><expr> <M-i> coc#refresh()
