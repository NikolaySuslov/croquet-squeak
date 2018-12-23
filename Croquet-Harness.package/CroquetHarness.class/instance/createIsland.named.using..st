initialize
createIsland: islandClass named: aString using: controller
	"Create a new island. islandClass must be a class that is used to generate the contents of the TIsland. aString is a name for the router/island that allows another user to identify it. controller is the controller to use for the island"
	| island id fileName file data sync p |
	id := islandClass islandID.
	controller heartbeat: 20.
	controller beServer.	"act as server"

	"Decide whether we need to recreate the island"
	self enableIslandCache ifTrue:[
		fileName := islandClass name,'.c3d'.
		file := [self cacheDirectory readOnlyFileNamed: fileName] 
			on: FileDoesNotExistException 
			do:[:ex| ex return: nil].
		file ifNotNil:[
			"Load island from file"
			file binary.
			[data := file contents] ensure:[file close].
			island := [controller restore: data] on: Error do:[:ex|
				(UIManager default 
					chooseFrom: #('Ignore' 'Debug') 
					title: 'Could not load ', fileName,':\' withCRs, ex description) = 2
						ifTrue:[Processor activeProcess debug: ex signalerContext 
									title: ex description  full: true].
				ex return: nil.
			].
			island ifNotNil:[
				"Ask the controller to update the router's time stamp"
				p := controller routerStamp: (island get: #time).
				p wait. "until the new time base is in effect"
			].
		].
	].
	island ifNotNil:[controller island: island].
	island ifNil:[
		"Create a new island"
		island := controller newIsland. "Create a new island handled by the controller"
		"the island must have the same id/name as the router to generate postcards"
		island future id: id name: aString. 
		sync := island future new: islandClass.
		self enableIslandCache ifTrue:[
			sync wait.
			"Make sure we don't interfere with render - render may hold a lock on the island which will not get released since this is the main thread being expected to signal readyToRender. Therefore we signal readyToRender right here to force it to render if a render operation was pending (if not, we fall right through this code)."
			readyToRender signal.
			readyToRender wait.
			data := controller snapshot.
			file := self cacheDirectory forceNewFileNamed: fileName.
			file binary.
			[file nextPutAll: data] ensure:[file close].
		].
	].
	"self updateEmbeddedAppsIn: island."
	islandsByName at: aString put: island.
	islandsByID at: id put: island.

	^island