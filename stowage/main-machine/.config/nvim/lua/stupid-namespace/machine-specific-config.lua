local module = {}

local sdk_location = os.getenv('HOME') .. '/mine/programs/sdkman/candidates/java'

module.runtimes = {
	{
		name = 'JavaSE-21',
		path = sdk_location .. '/21.0.1-tem',
	},
}

return module
