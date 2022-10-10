-- this is a collection of utilities that should be in the global namespace for convenience

options = vim.opt
g_vars = vim.g

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

map_normal = get_mapper('n', false)
map_visual = get_mapper('v', false)
map_insert = get_mapper('i', false)

augroup = function(name, opts)
	opts = opts or {}
	return vim.api.nvim_create_augroup(name, opts)
end

autocommand = vim.api.nvim_create_autocmd
