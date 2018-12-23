parsing
parseVFBFile: filename texture: txtr
	"Read in a mesh from the vfb file"
	| aFile w x y z bytes version vCount fCount verticesPerFace vertices vtxNormals vtxTexCoords faces |
		aFile := (StandardFileStream readOnlyFileNamed: filename) binary.
	"Read in the version number"
	bytes := aFile next: 4.
	version := bytes unsignedLongAt: 1 bigEndian: false.
	(version = 1) ifTrue: [
		"Read in the number of vertices"
		bytes := aFile next: 4.
		vCount := bytes unsignedLongAt: 1 bigEndian: false.
	] ifFalse: [
		vCount := version.
		version := 0.
	].

	(vCount <= 0) ifTrue: [
		aFile close.
		^nil
	].
	vertices := Vector3Array new: vCount.
	vtxNormals := Vector3Array new: vCount.
	vtxTexCoords := Texture2Array new: vCount.
	"Read in the vertices"
	1 to: vCount do: [:i | bytes := aFile next: 32.
		x := Float fromIEEE32Bit: (bytes unsignedLongAt: 1 bigEndian: false).
		y := Float fromIEEE32Bit: (bytes unsignedLongAt: 5 bigEndian: false).
		z := Float fromIEEE32Bit: (bytes unsignedLongAt: 9 bigEndian: false).
		vertices at: i put: (Vector3 x: (x negated) y: y z: z).
		x := Float fromIEEE32Bit: (bytes unsignedLongAt: 13 bigEndian: false).
		y := Float fromIEEE32Bit: (bytes unsignedLongAt: 17 bigEndian: false).
		z := Float fromIEEE32Bit: (bytes unsignedLongAt: 21 bigEndian: false).
		vtxNormals at: i put: (Vector3 x: (x negated) y: y z: z).
		x := Float fromIEEE32Bit: (bytes unsignedLongAt: 25 bigEndian: false).
		y := Float fromIEEE32Bit: (bytes unsignedLongAt: 29 bigEndian: false).
		y := 1.0 + (0.0 - y).
		vtxTexCoords at: i put: (Vector2 u: x v: y).
	].

	"Read in the number of faces"
	bytes := aFile next: 4.
	fCount := bytes unsignedLongAt: 1 bigEndian: false.
	(fCount <= 0) ifTrue: [
		aFile close.
		^nil].

	"Read past the faceDataCount value"
	aFile next: 4.
	(version = 0) 
		ifTrue: [ verticesPerFace := 0. ] 
		ifFalse: [bytes := aFile next: 4.
				verticesPerFace := bytes unsignedLongAt: 1 bigEndian: false].

	(verticesPerFace = 0) ifTrue: [
		faces := WriteStream on: (IntegerArray new: fCount*3).
		1 to: fCount do: [: i |
			bytes := aFile next: 4.
			w := bytes unsignedLongAt: 1 bigEndian: false.
			(w = 3) ifTrue: [
				bytes := aFile next: 4.
				x := (bytes unsignedLongAt: 1 bigEndian: false).
				bytes := aFile next: 4.
				y := (bytes unsignedLongAt: 1 bigEndian: false).
				bytes := aFile next: 4.
				z := (bytes unsignedLongAt: 1 bigEndian: false).
				faces nextPut: z; nextPut: y; nextPut: x.
			] ifFalse: [
				1 to: w do: [: j | aFile next: 4]
			].
		].
		faces := faces contents.
	].
	(verticesPerFace = 3) ifTrue: [
		faces := WriteStream on: (IntegerArray new: fCount*3).
		1 to: fCount do: [: i |
			bytes := aFile next: 4.
			x := (bytes unsignedLongAt: 1 bigEndian: false).
			bytes := aFile next: 4.
			y := (bytes unsignedLongAt: 1 bigEndian: false).
			bytes := aFile next: 4.
			z := (bytes unsignedLongAt: 1 bigEndian: false).
			faces nextPut: z; nextPut: y; nextPut: x.
		].
		faces := faces contents.
	].

	aFile close.
	^self buildMesh: vertices faces: faces normals: vtxNormals textureUV: vtxTexCoords textureMap: txtr.