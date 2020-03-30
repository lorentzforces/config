let mapleader = "\<SPACE>"

nnoremap <leader><leader> :Files<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>g :Rg<SPACE>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>c :tabnew<CR>
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>H :tabmove -<CR>
nnoremap <leader>L :tabmove +<CR>

nnoremap <leader>s :set hlsearch!<CR>

" escape exits terminal mode
tnoremap <Esc> <C-\><C-n>

