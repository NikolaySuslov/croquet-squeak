accessing
triangulate
	| newFaces newFace |

	"Returns a new collection of triangular faces if this face has > 3 vertices."
	newFaces := OrderedCollection new.
	vertexIndices size = 3 
		ifTrue: [ newFaces add: self ]
		ifFalse: [
	 		3 to: vertexIndices size do: [:i |
				newFace := self class new.
				newFace materialName: materialName.

				{1. i-1. i} do: [:j |
					newFace vertexIndices add: (vertexIndices at: j).
					textureUVIndices size > 0 ifTrue: [
						newFace textureUVIndices add: (textureUVIndices at: j).
					].
					normalIndices size > 0 ifTrue: [
						newFace normalIndices add: (normalIndices at: j).
					].
				].
			
				newFaces add: newFace.
			].
		].

	^ newFaces
