parsing
parseOBJFile: filename texture: txtr
	"Read in a mesh from the obj file"
	| aFile pos line words oldWords triple vCount fCount index vertices vtxTexCoords vtxNormals faces u v |
	aFile := (CrLfFileStream readOnlyFileNamed: filename) ascii.
	line := aFile upTo: (Character cr).
	words := line findTokens: ' '.
	vCount := 0.
	"Count the vertices"
	[ (words at: 1) = 'v' ] whileTrue: [
		vCount := vCount + 1.
		line := aFile upTo: (Character cr).
		words := line findTokens: ' '.
	].

	"Now reset the file and grab the actual data"
	aFile position: 0.

	"Create the vertex array"
	vertices := Vector3Array new: vCount.

	"Read in the vertices"
	line := aFile upTo: (Character cr).
	words := line findTokens: ' '.

	index := 1.
	[ (words at: 1) = 'v' ] whileTrue: [ 
		vertices at: index put:
				(Vector3 x: ((words at: 2) asNumber)
							y: ((words at: 3) asNumber)
							z: ((words at: 4) asNumber)).
		index := index + 1.
		line := aFile upTo: (Character cr).
		words := line findTokens: ' '.
	].

	"Read in the texture coordinates"
	index := 1.
	vtxTexCoords := Texture2Array new: vCount.
	[ (words at: 1) = 'vt' ] whileTrue: [
		u := (words at: 2) asNumber.
		v := (words at: 3) asNumber.
		v := 1.0 + (0.0 - v).
		vtxTexCoords at: index put: (Vector2 u: u v: v).
		index := index + 1.
		line := aFile upTo: (Character cr).
	 	words := line findTokens: ' '.
	].

	"Read in the normals"
	index := 1.
	vtxNormals := Vector3Array new: vCount.
	[ (words at: 1) = 'vn' ] whileTrue: [
		vtxNormals at: index
					put: (Vector3 x: ((words at: 2) asNumber)
									 y: ((words at: 3) asNumber)
									 z: ((words at: 4) asNumber)).
		index := index + 1.
		line := aFile upTo: (Character cr).
	 	words := line findTokens: ' '.
	].

	pos := aFile position.
	oldWords := words.

	"Count the faces"
	fCount := 0.
	[ (words size) > 0 ] whileTrue: [
		((words at: 1) = 'f') ifTrue: [fCount := fCount + 1 ].
		line := aFile upTo: (Character cr).
		words := line findTokens: ' '.
	].

	"Create the faces array"
	faces := WriteStream on: (IntegerArray new: fCount*3).

	aFile position: pos.
	words := oldWords.

	"Read in the faces"
	[ (words size) > 0 ] whileTrue: [
		((words at: 1) = 'f') ifTrue: [ 
			triple := (words at: 2) findTokens: '/'.
			faces nextPut: (triple at: 1) asNumber.

			triple := (words at: 3) findTokens: '/'.
			faces nextPut: (triple at: 1) asNumber.

			triple := (words at: 4) findTokens: '/'.
			faces nextPut: (triple at: 1) asNumber.
		].
		line := aFile upTo: (Character cr).
	 	words := line findTokens: ' '.
	].
	faces := faces contents.

	aFile close.
	^self buildMesh: vertices faces: faces normals: vtxNormals textureUV: vtxTexCoords textureMap: txtr.
