local module = {}

local sdk_location = os.getenv('HOME') .. '/.local/share/sdkman/candidates/java'

module.runtimes = {
	{
		name = 'JavaSE-21',
		path = sdk_location .. '/21.0.10-tem',
	},
}

return module
