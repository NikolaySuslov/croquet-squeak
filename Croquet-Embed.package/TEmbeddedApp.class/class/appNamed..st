app registry
appNamed: appName
	"Find the app with the corresponding name"
	^RegisteredApps at: appName ifAbsent:[nil].