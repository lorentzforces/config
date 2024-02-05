local module = {}

local sdk_location = os.getenv('HOME') .. '/mine/programs/sdkman/candidates/java'

module.runtimes = {
	{
		name = 'JavaSE-21',
		path = sdk_location .. '/21.0.1-amzn',
	},
	{
		name = 'JavaSE-1.8',
		path = sdk_location .. '/8.0.392-amzn',
	},
}

return module
