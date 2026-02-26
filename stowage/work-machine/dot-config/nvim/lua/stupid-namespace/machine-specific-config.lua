local module = {}

local sdk_location = os.getenv('HOME') .. '/.local/share/sdkman/candidates/java'

module.runtimes = {
	{
		name = 'JavaSE-23',
		path = sdk_location .. '/23.0.2-amzn',
	},
	{
		name = 'JavaSE-1.8',
		path = sdk_location .. '/8.0.472-amzn',
	},
}

return module
