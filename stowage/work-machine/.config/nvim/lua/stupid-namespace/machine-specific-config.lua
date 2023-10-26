local module = {}

local sdk_location = os.getenv('HOME') .. '/programs/sdkman/candidates/java'

module.runtimes = {
	{
		name = 'JavaSE-17',
		path = sdk_location .. '/17.0.7-amzn',
	},
	{
		name = 'JavaSE-1.8',
		path = sdk_location .. '/8.0.392-amzn',
	},
}

return module
