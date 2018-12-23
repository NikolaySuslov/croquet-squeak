initialize
initializeWithFileName: fName scale: scl shadeAngle: angle textureMode: txtrMd
	
	| fieldName field parseTree mesh fileName |
	self class initialize.  "Make sure most recent delimiters are set"
	Smalltalk garbageCollectMost.
	scale := scl.
	textureMode := txtrMd.
	"get full path name of file, and path of directory containing it"
	fileName := self findContentFileName: fName.
	filePath := FileDirectory on: (FileDirectory dirPathFor: fileName).

Transcript show: fName; cr.
	parseTree := self parseFileNamed: fName.
	Smalltalk garbageCollectMost.
	self shadeAngle: angle. "Use degrees, but convert to radians"
	frame := TGroup new.
"Transcript show:'parsing';cr."
	parseTree linksDo:[ :node |
	
Transcript show:'.'.
		fieldName := node name.
		field := node value.
		fieldName = #T3dsmaxAsciiexport ifTrue:[ " unused "].
		fieldName = #TComment ifTrue:[" unused "].
		fieldName = #TScene ifTrue:[" unused "].
		fieldName = #TMaterialList ifTrue:[ self makeMaterials: field ].
		fieldName = #TGeomobject ifTrue:[ 
			mesh := (self makeGeometry: field).
			frame addChild: mesh.
			].
		fieldName = #TGroup ifTrue:[ 
			mesh := (self makeGroup: field). 
			frame addChild: mesh.
			].
		].
"Transcript show:'!';cr. "
	frame frameChildren ifNotNilDo: 
		[:children | children size = 1 ifTrue: [frame := children at: 1]].
	frame prune.
	frame forceGlobalToLocal.
	Smalltalk garbageCollectMost.
Transcript show:'Loaded.';cr.