local module = {}

-- the opts table is optional, but will default the following properties if not passed:
-- - noremap: true
-- - silent: true
local get_mapper = function(mode, remap)
	return function(lhs, rhs, opts)
		opts = opts or {}
		opts.noremap = not remap
		if opts.silent == nil then
			opts.silent = true
		end
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

local map_normal = get_mapper('n', false)
local map_visual = get_mapper('v', false)
local map_insert = get_mapper('i', false)

local augroup = function(name, opts)
	opts = opts or {}
	return vim.api.nvim_create_augroup(name, opts)
end

local autocommand = vim.api.nvim_create_autocmd

local create_lsp_keybinds = function(client, bufnr)
	local bufopts = {buffer = bufnr}

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	map_normal('K', vim.lsp.buf.hover, bufopts)
	map_normal('gD', vim.lsp.buf.declaration, bufopts)
	map_normal('gd', vim.lsp.buf.definition, bufopts)
	map_insert('<M-i>', '<C-x><C-o>', bufopts)
	map_normal('<leader>a', vim.lsp.buf.code_action, bufopts)
end

local operating_system
if vim.loop.os_uname().sysname == "Darwin" then
	operating_system = "MAC_OS"
else
	operating_system = "LINUX"
end

module.options = vim.opt
module.local_options = vim.opt_local
module.g_vars = vim.g
module.map_normal = map_normal
module.map_visual = map_visual
module.map_insert = map_insert
module.augroup = augroup
module.autocommand = autocommand
module.create_lsp_keybinds = create_lsp_keybinds
module.operating_system = operating_system

return module
