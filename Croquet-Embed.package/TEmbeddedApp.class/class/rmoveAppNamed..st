app registry
rmoveAppNamed: appName
	"Remove the app with the given name"
	RegisteredApps removeKey: appName ifAbsent:[]