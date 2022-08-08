require('utils')

require('packer').startup(function(use)
	use('wbthomason/packer.nvim')
	use({'junegunn/fzf.vim', requires = {{'junegunn/fzf'}} })
	use('airblade/vim-gitgutter')
	use('ptzz/lf.vim')
		-- dependency of lf.vim, but needs to be loaded after
	use({'voldikss/vim-floaterm', after = 'lf.vim'})
	use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('neovim/nvim-lspconfig')
	use('tpope/vim-sleuth')
end)

options.number = false
options.cursorline = false
options.scrolloff = 3
options.wrap = true
options.linebreak = true
options.breakindent = true
options.list = true -- use the show hidden keybind to toggle
options.listchars = { tab = '▸ ', trail = '·'}
options.showbreak = '↳'
options.signcolumn = 'yes' -- provide a space and gutter at all times

options.splitright = true
options.incsearch = true
options.ignorecase = true
options.smartcase = true

options.expandtab = false
options.tabstop = 4
options.shiftwidth = 4
options.softtabstop = 4

options.mouse = 'a'

g_vars.mapleader = ' '

map_normal('<leader><leader>', ':Files<CR>')
map_normal('<leader>f', ':Lf<CR>')
map_normal('<leader>g', ':Rg<SPACE>', {silent = false})
map_normal('<leader>b', ':Buffers<CR>')

map_normal('<C-j>', 'o<Esc>gk')
map_normal('<C-k>', 'O<Esc>gj')

-- tab navigation
map_normal('<leader>c', ':tabnew<CR>')
map_normal('<leader>p', ':tabprevious<CR>')
map_normal('<leader>n', ':tabnext<CR>')
map_normal('<leader>P', ':tabmove -<CR>')
map_normal('<leader>N', ':tabmove +<CR>')

-- window navigation
map_normal('<leader>-', ':sp<CR>')
map_normal('<leader>|', ':vsp<CR>')
map_normal('<leader>h', '<C-w>h')
map_normal('<leader>j', '<C-w>j')
map_normal('<leader>k', '<C-w>k')
map_normal('<leader>l', '<C-w>l')
map_normal('<leader>H', '<C-w>H')
map_normal('<leader>J', '<C-w>J')
map_normal('<leader>K', '<C-w>K')
map_normal('<leader>L', '<C-w>L')
map_normal('<leader>x', ':q<CR>')

-- sane movement with wrap turned on
map_normal('j', 'gj')
map_normal('k', 'gk')
map_visual('j', 'gj')
map_visual('k', 'gk')

map_normal(
	'<leader>s',
	function()
		options.hlsearch = not options.hlsearch:get()
	end
)
map_normal(
	'<leader>i',
	function()
		options.list = not options.list:get()
	end
)

-- this controls the delay before nvim writes its swap file, so this may have consequences
-- this impacts how quickly gitgutter decorations show up
options.updatetime = 300 -- default is 4000 ms

g_vars.gitgutter_map_keys = 0
g_vars.lf_replace_netrw = 1
g_vars.lf_map_keys = 0

local trailing_whitespace_group = augroup('user_trim_trailing_whitespace')
autocommand(
	'BufWritePre',
	{
		group = trailing_whitespace_group,
		pattern = '*',
		command = '%s/\\s\\+$//e',
	}
)

-- TODO: there's probably a much better way of doing this
options.statusline =
	'%f'
	..' %#StatusLineFlag#%h%w%r%*'
	..'%#StatusLineModified#%m%*'
	..' %=%c%V on %l/%L'

options.termguicolors = true
vim.cmd([[
	colorscheme narcissus
]])

require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'bash',
		'comment',
		'html',
		'java',
		'json',
		'lua',
		'query',
		'rust',
		'sql',
		'typescript',
		'vim',
		'yaml',
	},
	sync_install = false,
	highlight = {
		enable = true,
		disable = {},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
	},
	indent = {
		enable = false
	}
})

local on_ls_attach = function(client, bufnr)
	local bufopts = {buffer = bufnr}

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	map_normal('K', vim.lsp.buf.hover, bufopts)
	map_normal('gD', vim.lsp.buf.declaration, bufopts)
	map_normal('gd', vim.lsp.buf.definition, bufopts)
	map_insert('<M-i>', '<C-x><C-o>', bufopts)
	map_normal('<leader>a', vim.lsp.buf.code_action, bufopts)

end

local auto_close_completion_group = augroup('auto_close_completion_group')
autocommand(
	'CompleteDone',
	{
		group = auto_close_completion_group,
		pattern = '*',
		command = 'pclose',
	}
)

local lsp_config = require('lspconfig')

lsp_config.jdtls.setup({
	on_attach = on_ls_attach
})

lsp_config.rust_analyzer.setup({
	on_attach = on_ls_attach
})
