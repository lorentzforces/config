local module = {}

local sdk_location = os.getenv('HOME') .. '/.local/share/sdkman/candidates/java'

module.runtimes = {
	{
		name = 'JavaSE-23',
		path = sdk_location .. '/23.0.2-amzn',
	},
	{
		name = 'JavaSE-17',
		path = sdk_location .. '/17.0.19-amzn',
	},
	{
		name = 'JavaSE-11',
		path = sdk_location .. '/11.0.30-amzn',
	},
}

return module
