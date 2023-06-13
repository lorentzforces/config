local util = require('stupid-namespace.utils')

require('packer').startup(function(use)
	use('wbthomason/packer.nvim')
	use({'junegunn/fzf.vim', requires = {{'junegunn/fzf'}} })
	use('airblade/vim-gitgutter')
	use('ptzz/lf.vim')
	-- dependency of lf.vim, but needs to be loaded after for reasons
	use({'voldikss/vim-floaterm', after = 'lf.vim'})
	use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('tpope/vim-sleuth')
	use('neovim/nvim-lspconfig')
	use('mfussenegger/nvim-jdtls')
end)

util.options.number = true
util.options.relativenumber = true
util.options.cursorline = true
util.options.cursorlineopt = "number"
util.options.scrolloff = 3
util.options.wrap = true
util.options.linebreak = true
util.options.breakindent = true
util.options.list = true -- use the show hidden keybind to toggle
util.options.listchars = { tab = '▸ ', trail = '·'}
util.options.showbreak = '↳'
util.options.signcolumn = 'yes' -- provide a space and gutter at all times

util.options.splitright = true
util.options.incsearch = true
util.options.ignorecase = true
util.options.smartcase = true

util.options.expandtab = false
util.options.tabstop = 4
util.options.shiftwidth = 4
util.options.softtabstop = 4

util.g_vars.floaterm_wintype = 'split'
util.g_vars.floaterm_position = 'aboveleft'

util.options.mouse = 'a'

util.g_vars.mapleader = ' '

util.map_normal('<leader><leader>', ':Files<CR>')
util.map_normal('<leader>f', ':Lf<CR>')
util.map_normal('<leader>g', ':Rg<SPACE>', {silent = false})
util.map_normal('<leader>b', ':Buffers<CR>')

util.map_normal('<C-j>', 'o<Esc>gk')
util.map_normal('<C-k>', 'O<Esc>gj')

-- tab navigation
util.map_normal('<leader>c', ':tabnew<CR>')
util.map_normal('<leader>p', ':tabprevious<CR>')
util.map_normal('<leader>n', ':tabnext<CR>')
util.map_normal('<leader>P', ':tabmove -<CR>')
util.map_normal('<leader>N', ':tabmove +<CR>')

-- window navigation
util.map_normal('<leader>-', ':sp<CR>')
util.map_normal('<leader>|', ':vsp<CR>')
util.map_normal('<leader>h', '<C-w>h')
util.map_normal('<leader>j', '<C-w>j')
util.map_normal('<leader>k', '<C-w>k')
util.map_normal('<leader>l', '<C-w>l')
util.map_normal('<leader>H', '<C-w>H')
util.map_normal('<leader>J', '<C-w>J')
util.map_normal('<leader>K', '<C-w>K')
util.map_normal('<leader>L', '<C-w>L')
util.map_normal('<leader>x', ':q<CR>')

-- sane movement with wrap turned on
util.map_normal('j', 'gj')
util.map_normal('k', 'gk')
util.map_visual('j', 'gj')
util.map_visual('k', 'gk')

util.map_normal(
	'<leader>s',
	function()
		util.options.hlsearch = not util.options.hlsearch:get()
	end
)
util.map_normal(
	'<leader>i',
	function()
		-- TODO: iterate over windows and toggle this on all of them
		util.options.list = not util.options.list:get()
	end
)

vim.api.nvim_create_user_command(
	'Tab',
	function(opts)
		local indent_size = tonumber(opts.fargs[1])
		util.options.expandtab = false
		util.options.tabstop = indent_size
		util.options.softtabstop = indent_size
		util.options.shiftwidth = indent_size
	end,
	{ nargs = 1 }
)

vim.api.nvim_create_user_command(
	'Space',
	function(opts)
		local indent_size = tonumber(opts.fargs[1])
		util.options.expandtab = true
		util.options.tabstop = indent_size
		util.options.softtabstop = indent_size
		util.options.shiftwidth = indent_size
	end,
	{ nargs = 1 }
)

-- this controls the delay before nvim writes its swap file, so this may have consequences
-- this impacts how quickly gitgutter decorations show up
util.options.updatetime = 300 -- default is 4000 ms

util.g_vars.gitgutter_map_keys = 0
util.g_vars.lf_replace_netrw = 1
util.g_vars.lf_map_keys = 0

local trailing_whitespace_group = util.augroup('user_trim_trailing_whitespace')
util.autocommand(
	'BufWritePre',
	{
		group = trailing_whitespace_group,
		pattern = '*',
		command = '%s/\\s\\+$//e',
	}
)

-- TODO: there's probably a much better way of doing this
util.options.statusline =
	'%f'
	..' %#StatusLineFlag#%h%w%r%*'
	..'%#StatusLineModified#%m%*'
	..' %=%c%V on %l/%L'

util.options.termguicolors = true
vim.cmd([[
	colorscheme narcissus
]])

require('nvim-treesitter.configs').setup({
	ensure_installed = {
		-- bash highlighting is variable, seems to be different between makefiles and plain
		-- shell scripts
		-- 'bash',
		'comment',
		'go',
		'html',
		'java',
		'javascript',
		'json',
		'lua',
		'python',
		'query',
		'rust',
		'sql',
		'starlark',
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

local auto_close_completion_group = util.augroup('auto_close_completion_group')
util.autocommand(
	'CompleteDone',
	{
		group = auto_close_completion_group,
		pattern = '*',
		command = 'pclose',
	}
)

local lsp_config = require('lspconfig')

lsp_config.rust_analyzer.setup({
	on_attach = util.create_lsp_keybinds
})

lsp_config.gopls.setup({
	on_attach = util.create_lsp_keybinds
})
