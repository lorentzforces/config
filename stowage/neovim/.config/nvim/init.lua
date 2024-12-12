local util = require('stupid-namespace.utils')

-- bootstrap lazy.nvim for plugin management
-- taken from https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	spec = {
		{'junegunn/fzf.vim', dependencies = {'junegunn/fzf',} },
		{'airblade/vim-gitgutter', branch = 'main'},
		-- Floaterm is technically a dependency of lf.vim, but needs to be loaded
		-- after lf.vim for Reasons™. We declare lf.vim as a dependency to make sure
		-- that it gets loaded first.
		{'voldikss/vim-floaterm', dependencies = 'ptzz/lf.vim'},
		{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
		'neovim/nvim-lspconfig',
		'mfussenegger/nvim-jdtls',
		'towolf/vim-helm',
		'shortcuts/no-neck-pain.nvim',
		'lorentzforces/rectify-buffers.nvim',
	},
	dev = {
		path = '~/mine/repos',
	},
})

util.options.number = false
util.options.relativenumber = false
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

vim.api.nvim_command('filetype indent off')

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
util.map_normal('<leader>z', ':NoNeckPain<CR>')

-- sane movement with wrap turned on
util.map_normal('j', 'v:count ? \'j\' : \'gj\'', {expr = true})
util.map_normal('k', 'v:count ? \'k\' : \'gk\'', {expr = true})
util.map_visual('j', 'v:count ? \'j\' : \'gj\'', {expr = true})
util.map_visual('k', 'v:count ? \'k\' : \'gk\'', {expr = true})

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

-- <leader>d is the prefix chosen for LSP diagnostic things
util.map_normal(
	'<leader>dv',
	function()
		vim.diagnostic.setloclist()
	end
)
util.map_normal(
	'<leader>dn',
	function()
		vim.diagnostic.goto_next()
	end
)
util.map_normal(
	'<leader>dp',
	function()
		vim.diagnostic.goto_prev()
	end
)

util.g_vars.gitgutter_use_location_list = true
util.g_vars.gitgutter_map_keys = 0
-- <leader>v is the prefix chosen for version control things
util.map_normal('<leader>vp', ':GitGutterPrevHunk<CR>')
util.map_normal('<leader>vn', ':GitGutterNextHunk<CR>')
util.map_normal('<leader>vv', ':GitGutterQuickFixCurrentFile | lopen<CR>')
util.map_normal('<leader>vd', ':GitGutterDiffOrig<CR>')

vim.api.nvim_create_user_command(
	'Tab',
	function(opts)
		local indent_size = tonumber(opts.fargs[1])
		util.set_indents(util.INDENT_TABS, indent_size)
	end,
	{ nargs = 1 }
)

vim.api.nvim_create_user_command(
	'Space',
	function(opts)
		local indent_size = tonumber(opts.fargs[1])
		util.set_indents(util.INDENT_SPACES, indent_size)
	end,
	{ nargs = 1 }
)

-- this controls the delay before nvim writes its swap file, so this may have consequences
-- this impacts how quickly gitgutter decorations show up
util.options.updatetime = 300 -- default is 4000 ms

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
vim.cmd('colorscheme narcissus')

require('no-neck-pain').setup({
	-- debug = true,
	width = 126,
	autocmds = {
		enableOnVimEnter = true,
		enableOnTabEnter = true,
	},
})

require('rectify-buffers').setup({
	user_function = 'LspRestart'
})

require('nvim-treesitter.configs').setup({
	ensure_installed = {
		-- bash highlighting is variable, seems to be different between makefiles and plain
		-- shell scripts
		'bash',
		'comment',
		'go',
		'html',
		'java',
		'javascript',
		'json',
		'markdown',
		'markdown_inline', -- regular markdown TS is broken without this as well
		'python',
		'rust',
		'sql',
		'starlark',
		'typescript',
		'yaml',
		-- the following are required due to this issue:
		-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3970#issuecomment-1377128659
		'c',
		'lua',
		'query',
		'vim',
		'vimdoc',
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

-- jdtls (Eclipse-based Java LSP) is configured separately in a file type plugin file for Java

lsp_config.bashls.setup({
	on_attach = util.create_lsp_keybinds
})

lsp_config.gopls.setup({
	on_attach = util.create_lsp_keybinds
})

lsp_config.rust_analyzer.setup({
	on_attach = util.create_lsp_keybinds
})
