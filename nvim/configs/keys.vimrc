let mapleader = "\<SPACE>"

nnoremap <leader><leader> :Files<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>g :Rg<SPACE>
nnoremap <leader>b :Buffers<CR>

" tab navigation
nnoremap <leader>c :tabnew<CR>
nnoremap <leader>p :tabprevious<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <leader>P :tabmove -<CR>
nnoremap <leader>N :tabmove +<CR>

" window navigation
nnoremap <leader>- :sp<CR>
nnoremap <leader>\| :vsp<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L

nnoremap <leader>x :q<CR>

" vim only lets you increase and decrease the size of the split, it doesn't
" let you change in a specific direction
nnoremap <leader><M-h> <C-w><
nnoremap <leader><M-l> <C-w>>

nnoremap <leader><M-k> <C-w>+
nnoremap <leader><M-j> <C-w>-

nnoremap <leader>s :set hlsearch!<CR>

" TODO: find a way to make this work with words that start with "b"
" disabling for now due to above issue
" nnoremap K :Rg \b<C-R><C-W>\b<CR>

" escape exits terminal mode
tnoremap <C-Esc> <C-\><C-n>

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ability to insert blank lines without entering insert mode
nnoremap <C-j> o<Esc>gk
nnoremap <C-k> O<Esc>gj
