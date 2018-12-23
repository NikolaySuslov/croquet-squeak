embedded apps
updateEmbeddedAppsIn: anIsland
	"Update the embedded apps in the given island"
	| apps |
	anIsland ifNil:[^nil].
	"Transcript cr; show: 'Embedded app update request for ', anIsland."
	apps := anIsland future at: #embeddedApps.
	apps whenResolved:[
		"Transcript cr; show: 'Embedded apps: ', apps value."
		apps value ifNotNil:[apps value do:[:appRef| self updateEmbeddedApp: appRef]].
	].
	self runScript: #updateEmbeddedAppsIn: when:{anIsland. #updateEmbeddedApps}.