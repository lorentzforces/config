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

M.map_normal = get_mapper('n', false)
M.map_visual = get_mapper('v', false)
M.map_insert = get_mapper('i', false)

M.augroup = function(name, opts)
	opts = opts or {}
	return vim.api.nvim_create_augroup(name, opts)
end

M.autocommand = vim.api.nvim_create_autocmd

M.create_lsp_keybinds = function(client, bufnr)
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

M.operating_system = "LINUX"
if vim.loop.os_uname().sysname == "Darwin" then
	M.operating_system = "MAC_OS"
end

M.INDENT_TABS = "tabs"
M.INDENT_SPACES = "spaces"
M.set_indents = function(indent_type, size)
	local expandtab = false
	if indent_type == M.INDENT_TABS then
		expandtab = false
	elseif indent_type == M.INDENT_SPACES then
		expandtab = true
	else
		error(string.format("set_indents got an unexpected indent type: %s", indent_type))
	end

	vim.opt_local.expandtab = expandtab
	vim.opt_local.tabstop = size
	vim.opt_local.softtabstop = size
	vim.opt_local.shiftwidth = size
end

M.options = vim.opt
M.local_options = vim.opt_local
M.g_vars = vim.g

return M
