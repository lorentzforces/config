let mapleader = "\<SPACE>"

nnoremap <leader><leader> :Files<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>g :Rg<SPACE>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>c :tabnew<CR>
nnoremap <leader>p :tabprevious<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <leader>P :tabmove -<CR>
nnoremap <leader>N :tabmove +<CR>

nnoremap <leader>s :set hlsearch!<CR>

" TODO: find a way to make this work with words that start with "b"
" disabling for now due to above issue
" nnoremap K :Rg \b<C-R><C-W>\b<CR>

" escape exits terminal mode
tnoremap <Esc> <C-\><C-n>

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ability to insert blank lines without entering insert mode
nnoremap <C-j> o<Esc>gk
nnoremap <C-k> O<Esc>gj
