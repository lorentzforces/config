local util = require('stupid-namespace.utils')

-- bootstrap lazy.nvim for plugin management
-- taken from https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo(
			{
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			},
			true,
			{}
		)
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	spec = {
		{ 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf', } },
		{ 'airblade/vim-gitgutter', branch = 'main' },
		-- Floaterm is technically a dependency of lf.vim, but needs to be loaded
		-- after lf.vim for Reasons™. We declare lf.vim as a dependency to make sure
		-- that it gets loaded first.
		{ 'voldikss/vim-floaterm', dependencies = 'ptzz/lf.vim' },
		{ 'nvim-treesitter/nvim-treesitter', branch = 'main', build = ':TSUpdate', lazy = false },
		'neovim/nvim-lspconfig',
		'mfussenegger/nvim-jdtls',
		'towolf/vim-helm',
		{ 'shortcuts/no-neck-pain.nvim', version = "*" },
		-- TODO: debugging on dev branch, this is still broken for some reason for manpages
		-- { 'shortcuts/no-neck-pain.nvim', branch = 'feat/integrations' },
		{
			'ovk/endec.nvim',
			event = 'VeryLazy',
			opts = {
				keymaps = {
					defaults = false, -- keybinds don't seem to be created anyway?
					encode_base64_inplace = "<leader>qe",
					decode_base64_inplace = "<leader>qd",
				},
			},
		},
		'lorentzforces/rectify-buffers.nvim',
	},
	dev = {
		path = '~/mine/repos',
	},
})

local no_neck_pain = require('no-neck-pain')
local rectify_buffers = require('rectify-buffers')
local nvim_treesitter = require('nvim-treesitter')

-- currently experimenting with having numbers again
util.options.number = true
util.options.relativenumber = true

util.options.cursorline = true
util.options.cursorlineopt = "number"
util.options.scrolloff = 3
util.options.wrap = true
util.options.linebreak = true
util.options.breakindent = true
util.options.list = true -- use the show hidden keybind to toggle
util.options.listchars = { tab = '▸ ', trail = '·' }
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

-- I currently use the ":Rg" command, but this uses ripgrep for the regular :grep command as well
util.options.grepprg = 'rg --vimgrep'
util.options.grepformat = '%f:%l:%c:%m'

util.options.mouse = 'a'

util.g_vars.mapleader = ' '

util.map_normal('<leader>f', ':Lf<CR>')

-- aliases for functions from fzf-vim
util.map_normal('<leader>b', ':Buffers<CR>')
util.map_normal('<leader><leader>', ':Files<CR>')

-- reminder: use alt-a to select all in fzf (which will populate the quickfix list)
util.map_normal('<leader>g', ':Rg<SPACE>', {silent = false})

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
util.map_normal('<leader>z', no_neck_pain.toggle)

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
		local current_setting = util.options.list:get()
		for _, win in pairs(vim.api.nvim_list_wins()) do
			vim.api.nvim_win_call(
				win,
				function()
					util.options.list = not current_setting
				end
			)
		end
	end
)

-- diagnostics: use callback to show diagnostic text in a floating view when jumped to
vim.diagnostic.config({
  jump = { on_jump = function(diagnostic, bufnr)
    if not diagnostic then return end
    vim.diagnostic.open_float({ bufnr = bufnr, scope = 'cursor', focus = false, })
  end },
})

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
		vim.diagnostic.jump({count = 1})
	end
)
util.map_normal(
	'<leader>dp',
	function()
		vim.diagnostic.jump({count = -1})
	end
)
util.map_normal(
	'<M-k>',
	function()
		vim.diagnostic.open_float()
	end
)

util.g_vars.gitgutter_use_location_list = true
util.g_vars.gitgutter_map_keys = 0
-- <leader>v is the prefix chosen for version control things
util.map_normal('<leader>vp', ':GitGutterPrevHunk<CR>')
util.map_normal('<leader>vn', ':GitGutterNextHunk<CR>')
util.map_normal('<leader>vv', ':GitGutterQuickFixCurrentFile | lopen<CR>')
util.map_normal('<leader>vd', ':GitGutterDiffOrig<CR>')
util.map_normal('<M-v>', ':GitGutterPreviewHunk<CR>')

-- attempt #1 at clearing floating stuff that doesn't want to die
util.map_normal(
	'<M-l>',
	function()
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_config(win).relative == "win" then
				vim.api.nvim_win_close(win, false)
			end
		end
	end
)

vim.api.nvim_create_user_command(
	'Tab',
	function(opts)
		local parsed_num = tonumber(opts.fargs[1])
		if parsed_num == nil then
			error("Attempted to call tab indent function with a non-numeric argument")
		end
		local indent_size = math.floor(parsed_num)
		util.set_indents(util.INDENT_TABS, indent_size)
	end,
	{ nargs = 1 }
)

vim.api.nvim_create_user_command(
	'Space',
	function(opts)
		local parsed_num = tonumber(opts.fargs[1])
		if parsed_num == nil then
			error("Attempted to call space indent function with a non-numeric argument")
		end
		local indent_size = math.floor(parsed_num)
		util.set_indents(util.INDENT_SPACES, indent_size)
	end,
	{ nargs = 1 }
)

local detect_indent_on_line = function()
	local current_line = vim.api.nvim_get_current_line()
	local first_non_whitespace, _ = string.find(current_line, "%S") or 1, 0
	local indent_size = first_non_whitespace - 1

	-- if there is no leading whitespace, then don't touch anything
	if indent_size == 0 then
		return
	end

	local first_char = string.sub(current_line, 1, 1)
	if first_char == '\t' then
		-- hardcode tabs to be 4 spaces
		util.set_indents('tabs', 4)
	elseif first_char == ' ' then
		util.set_indents('spaces', indent_size)
	else
		error('Could not determine indent type from line.')
	end
end

util.map_normal('<leader>I', detect_indent_on_line)

-- experiment with relativenumber config

local toggle_numbers = function()
	local current_val = util.options.number:get()
	for _, win in pairs(vim.api.nvim_list_wins()) do
		vim.api.nvim_win_call(
			win,
			function()
				util.options.number = not current_val
				util.options.relativenumber = not current_val
			end
		)
	end
end

util.map_normal(
	'<leader>N',
	toggle_numbers
)

vim.api.nvim_create_user_command(
	'Numbie',
	toggle_numbers,
	{}
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

-- filetype registration
vim.filetype.add({
	pattern = {
		-- kubeconfig files are very naming-convention
		['.*kube/config.*'] = 'yaml',
	},
})

no_neck_pain.setup({
	-- debug = true,
	width = 126,
	autocmds = {
		enableOnVimEnter = true,
	},
})

rectify_buffers.setup({
	user_function = function()
		for _, client in pairs(vim.lsp.get_clients()) do
			-- There doesn't seem to be a lua API to restart a client, only to stop it.
			-- Since jdtls has its whole own set of config stuff it does, it's much easier to tell
			-- all the clients to restart rather than trying to stop them, then pull up their
			-- config and start that.
			vim.api.nvim_command('lsp restart ' .. client.name)
		end
	end
})

nvim_treesitter.install({
	-- 'bash', -- bash grammar can't handle bash 5.3 no-subshell command substitution
	'comment',
	'go',
	'html',
	'java',
	'javascript',
	'json',
	'markdown',
	'markdown_inline', -- regular markdown treesitter is broken without this as well
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
})

-- new version of treesitter needs to be enabled explicitly
util.autocommand('FileType', {
	pattern = {
		'go', 'html', 'java',
		'javascript', 'json', 'lua',
		'markdown', 'python', 'rust',
		'sql', 'starlark',
		'typescript', 'yaml'
	},
	callback = function()
		vim.treesitter.start()
	end,
})

local auto_close_completion_group = util.augroup('auto_close_completion_group')
util.autocommand('CompleteDone', {
	group = auto_close_completion_group,
	pattern = '*',
	command = 'pclose',
})

-- jdtls (Eclipse-based Java LSP) is configured separately in a ftplugin file for Java

vim.lsp.config('bashls', {
	on_attach = util.create_lsp_keybinds,
})
vim.lsp.config('gopls', {
	on_attach = util.create_lsp_keybinds,
	settings = {
		gopls = {
			analyses = {
				simplifyrange = false,
			},
		},
	},
})
vim.lsp.config('lua_ls', {
	on_attach = util.create_lsp_keybinds,
	on_init = function(client)
		-- adapted from lspconfig docs at:
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath('config') and path ~= os.getenv('HOME') .. '/config'
				and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
			then
				-- not in neovim config, bail on special setup
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend(
			'force',
			client.config.settings.Lua,
			{
				runtime = {
					-- neovim is probably using LuaJIT
					version = 'LuaJIT',
					path = {
						'lua/?.lua',
						'lua/?/init.lua',
					}
				},
				workspace = {
					checkThirdParty = false,
					-- filtering required due to this issue: https://github.com/neovim/nvim-lspconfig/issues/3189
					library = vim.tbl_filter(
						function(d)
							return not d:match(vim.fn.stdpath('config') .. '/?a?f?t?e?r?')
						end,
						vim.api.nvim_get_runtime_file('', true) -- all installed plugins
					),
				},
			}
		)
	end,
})
vim.lsp.config('rust_analyzer', {
	on_attach = util.create_lsp_keybinds,
})
vim.lsp.enable({'bashls', 'gopls', 'lua_ls', 'rust_analyzer'})
