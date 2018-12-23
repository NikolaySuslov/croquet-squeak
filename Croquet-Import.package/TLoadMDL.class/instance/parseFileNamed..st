parsing
parseFileNamed: filename
	"Creates a new actor using the specification from the given file"
	| aFile words line startSubstr index parent name texture meshFile matrix baseActor newActor fileVersion pos |

	words := (filename findTokens: '.').
	aFile :=  (MultiByteFileStream readOnlyFileNamed: filename) ascii;
	 wantsLineEndConversion: true;
	 yourself.

	"Check what version this mdl file is"
	line := aFile upTo: (Character cr).
	line := aFile upTo: (Character cr).
	line := aFile upTo: (Character cr).

	((line truncateTo: 7) = 'version')
		ifTrue: [ fileVersion := 1 ]
		ifFalse: [ fileVersion := 0 ].

	[ line := aFile upTo: (Character cr).
	aFile atEnd] whileFalse:[
		words := line findTokens: '='.
		"See if we're creating a new object"
		(((words size) > 1) and: [ ((words at: 2) beginsWith: ' _MakeObject')
			or: [ (words at: 2) beginsWith: ' Alice.MakeObject' ] ]) ifTrue: [
			(fileVersion = 0) ifTrue: [
				words := line findTokens: #,.
				parent := (words at: 2) withBlanksTrimmed.
				name := (((words at: 3) withBlanksTrimmed) findBetweenSubStrs: '"') at: 1.
			] ifFalse: [
				name := (words at: 1) truncateTo: (((words at: 1) size) - 1).
				parent := ((words at: 3) findTokens: #,) at: 1.
			].

			"Now pull in the texture to use"
			startSubstr := name , '.SetTexture'.
			pos := aFile position.
			texture := nil.
			[aFile atEnd or:[texture notNil]] whileFalse:[
				line := aFile upTo: (Character cr).
				(line beginsWith: startSubstr) ifTrue:[
					texture := (line findBetweenSubStrs: '"') at: 2.
					texture := self spell: texture in: aFile directory]].
			texture ifNil:[aFile position: pos].

			"Read the composite matrix to use"
			startSubstr := name , '._SetLocalTransformation'.
			pos := aFile position.
			matrix := nil.
			[aFile atEnd or:[matrix notNil]] whileFalse:[
				line := aFile upTo: (Character cr).
				(line beginsWith: startSubstr) ifTrue:[
					matrix := Matrix4x4 new.
					words := line findBetweenSubStrs: ',()'.
					words removeAllSuchThat: [:str | str = ' '].
					index := words size - 15.
					1 to: 4 do:[:j|
						1 to: 4 do:[:i|
							matrix at: i at: j put: 
								((words at: index) withBlanksTrimmed) asNumber.
							index := index + 1.]].
				].
			].
			matrix ifNil:[aFile position: pos].

			"Read the mesh file to use"
			startSubstr := 'LoadGeometry'.
			pos := aFile position.
			meshFile := nil.
			[aFile atEnd or:[meshFile notNil]] whileFalse:[
				line := aFile upTo: (Character cr).
				(line beginsWith: startSubstr) ifTrue:[
					meshFile := (line findBetweenSubStrs: '"') at: 2.
					meshFile := (aFile directory pathName), FileDirectory slash, meshFile.
				].
			].
			meshFile ifNil:[aFile position: pos].

			"Now build the actor name"
			words := name findTokens: '.'.
			name := words last.
			name at: 1 put: ((name at: 1) asLowercase).

			"Now build the parent name"
			parent := parent copyReplaceAll: '.' with: ' '.

			"Now create the object"
			(parent = 'None') ifTrue: [
				baseActor := self loadMeshFromFile: meshFile texture: texture.
				baseActor ifNil:[
					baseActor := TFrame new.
					baseActor visible: false].
				baseActor objectName: name.
				matrix ifNotNil:[baseActor localTransform: matrix].
				baseActor translation: baseActor translation * self scaleFactor.
				baseActor solid: false.
				"end base actor creation"
			] ifFalse: [
				newActor := self loadMeshFromFile: meshFile texture: texture.
				newActor ifNil:[
					newActor := TFrame new.
					newActor visible: false].
				newActor objectName: name.
				parent := self getChildNamed: parent from: baseActor.
				parent addChild: newActor.
				matrix ifNotNil:[newActor localTransform: matrix].
				newActor translation: newActor translation * self scaleFactor.
				newActor solid: false.
				"end new actor with parent"
			].
		"end MakeObject parsing"
		].

	]. "end file parsing"

	aFile close.
	self fixTransformsIn: baseActor.
	^baseActor