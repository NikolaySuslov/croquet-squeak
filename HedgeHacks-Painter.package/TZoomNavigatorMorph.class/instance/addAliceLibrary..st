alice items
addAliceLibrary: path
	| fd fileNames mdlFiles thumbs paths file thumb |
	self addBackButton: #aliceModels.
	fd := FileDirectory on: (FileDirectory pathFromURI: path).
	fileNames := fd fileNames.
	mdlFiles := fileNames select:[:any| any endsWith: '.mdl'].
	thumbs := fileNames select:[:any| any endsWith: '.gif'].
	mdlFiles := mdlFiles asSet.
	thumbs := thumbs asSet.
	paths := fd directoryNames.
	"add paths"
	paths do:[:dir|
		(thumbs includes: dir,'.gif') ifTrue:[
			file := fd readOnlyFileNamed: dir,'.gif'.
			thumb := Form fromBinaryStream: file.
			thumb := thumb asFormOfDepth: 32.
			file close.
		] ifFalse:[thumb := nil].
		self addAlicePath: (path,'/', dir) image: thumb.
	].
	"Now add tea files"
	mdlFiles := mdlFiles asArray sort:[:s1 :s2| (s1 compare: s2) <= 2].
	mdlFiles do:[:fname|
		(thumbs includes: (fname allButLast: 4),'.gif') ifTrue:[
			file := fd readOnlyFileNamed: (fname allButLast: 4),'.gif'.
			thumb := Form fromBinaryStream: file.
			thumb := thumb asFormOfDepth: 32.
			file close.
		] ifFalse:[thumb := nil].
		self addAliceFile: path,'/',fname image: thumb.
	].
