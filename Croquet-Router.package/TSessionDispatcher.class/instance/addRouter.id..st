accessing
addRouter: aRouter id: aSessionID
	"May overlap with connection attempt"
	mutex critical:[routers at: aSessionID put: aRouter].