local M = {}

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
	map_normal('gt', vim.lsp.buf.type_definition, bufopts)
	map_insert('<M-i>', '<C-x><C-o>', bufopts)
	map_normal('<M-h>', vim.lsp.buf.signature_help, bufopts)
	map_insert('<M-h>', vim.lsp.buf.signature_help, bufopts)
	map_normal('<leader>a', vim.lsp.buf.code_action, bufopts)
	map_normal('<leader>F', vim.lsp.buf.references, bufopts)
end

local operating_system
if vim.loop.os_uname().sysname == "Darwin" then
	operating_system = "MAC_OS"
else
	operating_system = "LINUX"
end

local set_indents = function(use_tabs, size)
	vim.opt.expandtab = not(use_tabs)
	vim.opt.tabstop = size
	vim.opt.softtabstop = size
	vim.opt.shiftwidth = size
end

M.options = vim.opt
M.local_options = vim.opt_local
M.g_vars = vim.g
M.map_normal = map_normal
M.map_visual = map_visual
M.map_insert = map_insert
M.augroup = augroup
M.autocommand = autocommand
M.create_lsp_keybinds = create_lsp_keybinds
M.operating_system = operating_system
M.set_indents = set_indents

return M
