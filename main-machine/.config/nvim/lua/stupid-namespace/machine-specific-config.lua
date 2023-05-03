local module = {}

local sdk_location = os.getenv('HOME') .. '/programs/sdkman/candidates/java'

module.runtimes = {
	{
		name = 'JavaSE-17',
		path =  sdk_location .. '/17.0.3-tem'
	},
}

return module
