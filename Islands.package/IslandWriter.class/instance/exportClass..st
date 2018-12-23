export
exportClass: aClass
	"Export class/version"
	(IslandReader isBlessedVersionID: aClass classVersionID) ifFalse:[
		self flag: #fixMe. "Should we raise an exception instead?"
		unblessed add: aClass.
	].
	dataStream nextPut: CodeClass.
	self export: aClass name.
	self export: aClass format.
	self export: aClass allInstVarNames.
	self export: aClass classVersionID.
