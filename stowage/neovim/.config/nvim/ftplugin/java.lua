local util = require('stupid-namespace.utils')
local machine_config = require('stupid-namespace.machine-specific-config')
local jdtls = require('jdtls')

local home = os.getenv('HOME')
local jdtls_location = home .. '/mine/programs/jdtls'
local lombok_location = home .. '/mine/programs/lombok/lombok.jar'
local sdk_location = home .. '/mine/programs/sdkman/candidates/java'

-- significantly cribbed from the excellent setup at:
--   https://sookocheff.com/post/vim/neovim-java-ide/
local root_markers = {'.git', 'gradlew', 'mvnw'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_dir = home .. '/.local/share/eclipse/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local jdtls_config
if util.operating_system == "MAC_OS" then
	jdtls_config = jdtls_location .. '/config_mac'
else
	jdtls_config = jdtls_location .. '/config_linux'
end

local config = {
	on_attach = util.create_lsp_keybinds,
	on_init = function(client, _)
		-- jdtls semantic tokens seem inconsistent and bad
		client.server_capabilities.semanticTokensProvider = nil
	end,
	settings = {
		java = {
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.mockito.Mockito.*",
				},
				importOrder = {
					"#",
					"",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999;
					staticStarThreshold = 9999;
				},
			},
			configuration = {
				runtimes = machine_config.runtimes
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
		'-configuration', jdtls_config,
		'-data', workspace_dir,
	},
}

jdtls.start_or_attach(config)
