local util = require('stupid-namespace.utils')
local jdtls = require('jdtls')

local home = os.getenv('HOME')
local jdtls_location = home .. '/programs/jdtls'
local lombok_location = home .. '/programs/lombok/lombok.jar'
local sdk_location = home .. '/programs/sdkman/candidates/java'

-- significantly cribbed from the excellent setup at:
--   https://sookocheff.com/post/vim/neovim-java-ide/
local root_markers = {'.git', 'gradlew', 'mvnw'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_dir = home .. '/.local/share/eclipse/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local config = {
	on_attach = util.create_lsp_keybinds,
	settings = {
		java = {
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.mockito.Mockito.*"
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999;
					staticStarThreshold = 9999;
				},
			},
			-- TODO: configure this per-machine
			configuration = {
				runtimes = {
					{
						name = 'JavaSE-17',
						path = sdk_location .. '/17.0.7-amzn'
					},
					{
						name = 'JavaSE-1.8',
						path = sdk_location .. '/8.0.362-amzn'
					},
				},
			},
		},
	},
	cmd = {
		'java', -- will run with whatever java executable is on the PATH
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx2g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-javaagent:' .. lombok_location,
		'-jar', vim.fn.glob(jdtls_location .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
		-- TODO: switch based on OS
		'-configuration', jdtls_location .. '/config_mac',
		'-data', workspace_dir,
	},
}

jdtls.start_or_attach(config)
