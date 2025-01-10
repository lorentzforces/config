local module = {}

local sdk_location = os.getenv('HOME') .. '/mine/programs/sdkman/candidates/java'

module.runtimes = {
	{
		name = 'JavaSE-23',
		path = sdk_location .. '/23.0.1-tem',
	},
}

return module
