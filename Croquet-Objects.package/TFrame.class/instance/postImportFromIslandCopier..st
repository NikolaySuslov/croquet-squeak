fileIn/Out
postImportFromIslandCopier: importer
	| frame |
	super postImportFromIslandCopier: importer.
	"Create new object id after copying"
	objectID ifNil:[objectID := TObjectID for: self].
	self register.
	"Restore object ownership"
	ownedObjects ifNotNil:[
		ownedObjects keys do:[:id|
			frame := ownedObjects removeKey: id.
			ownedObjects at: frame objectID put: frame.
		].
	].