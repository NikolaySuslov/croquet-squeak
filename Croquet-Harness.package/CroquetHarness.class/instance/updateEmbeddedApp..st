embedded apps
updateEmbeddedApp: appRef
	| appName appClass appID app |
	appID := appRef get: #appID.
	(self embeddedApps includesKey: appID) ifTrue:[^self]. "app already exists"
	appName := appRef get: #appName.
	appClass := TEmbeddedApp appNamed: appName.
	Transcript cr; show: 'Instantiating new ', appName asString, ' (', appClass name, ')'.
	appClass ifNotNil:[
		app := appClass instantiateEmbeddedApp: appRef.
	].
	app ifNil:[
		Transcript cr; show: 'WARNING: No app created for ', appName asString.
	] ifNotNil:[
		app userID: userID.
		self embeddedApps at: appID put: app
	].
