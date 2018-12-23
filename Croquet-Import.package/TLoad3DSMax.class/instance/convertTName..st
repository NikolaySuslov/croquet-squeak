parse
convertTName: aString 
	"(self new convertTName: 'SCENE_BACKGROUND_STATIC') = #TSceneBackgroundStatic"
	| strm start end str size name |
	name := aString asUppercase.
	name = 'MESH_VERTEX' ifTrue: [^#TMeshVertex].
	name = 'MESH_FACENORMAL' ifTrue: [^#TMeshFacenormal].
	name = 'MESH_VERTEXNORMAL' ifTrue: [^#TMeshVertexnormal].
	name = 'MESH_FACE' ifTrue: [^#TMeshFace].
	name = 'MESH_VERTCOL' ifTrue: [^#TMeshVertcol].
	name = 'MESH_CFACE' ifTrue: [^#TMeshCface].
	
	strm := WriteStream
				on: (String new: 40).
	strm nextPut: $T.
	"Because this is Tea and because some field start with  
	numbers."
	start := 1.
	size := aString size.
	[start <= size]
		whileTrue: [end := (aString
						indexOf: $_
						startingAt: start
						ifAbsent: [size + 1])
						- 1.
			str := aString copyFrom: start to: end.
			str translateToLowercase.
			str at: 1 put: str first asUppercase.
			strm nextPutAll: str.
			start := end + 2].
	^ strm contents asSymbol