accessing
addController: aController
	aController cacheManager: cacheMgr.
	controllers add: aController.
	"self updateEmbeddedAppsIn: aController island."
