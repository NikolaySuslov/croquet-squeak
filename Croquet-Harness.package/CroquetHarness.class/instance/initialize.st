initialize
initialize
	| seed |
	"Not really needed but a good thing to do for sanity checks and testing"
	FileDirectory addCroquetMimeTypes.
	"Make sure the current island's random is properly seeded"
	seed := ByteArray new: 128.
	(TCryptoRandom gatherEntropy: seed) ifFalse:[
		"Raise a warning about the poor quality of entropy"
		self inform: ' 
WARNING: SECURITY PROBLEM DETECTED!
 
This platform (', Smalltalk platformName, ') appears to have no good source
of entropy available. Since this DRAMATICALLY lowers the
quality of encryption we recommend bugging the platform
maintainer to work with the Croquet team to fix this problem.
 '.
	].
	Island default randomStream seedVector: seed.
	formMgr := self initializeFormManager.
	cacheMgr := formMgr cacheManager. "share it"
	enableIslandCache := false.
	controllers := OrderedCollection new.
	islandsByName := Dictionary new.
	islandsByID := Dictionary new.
	doRender := false.
	readyToRender := Semaphore new.
	overlays := #().
	eventPointer := TPointer new.
	redButtonPressed := false.
	yellowButtonPressed := false.
	snapshots := OrderedCollection new.
	userID := (TObjectID for: 'User').
	event := CroquetEvent new.
	event userID: userID.
	allowControllerAliasing := false.
	self initializeAvatar.
	self setupLocal.
	task := TTaskMain new.
	task harness: self.
	embeddedApps := Dictionary new.