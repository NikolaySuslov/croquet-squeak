app registry
registerApp: appClass name: appName
	"Register the given class as handling applications with the given appName"
	RegisteredApps ifNil:[self initialize].
	RegisteredApps at: appName put: appClass.
