parsing
triangulateFaces

	| newFaces |
	newFaces := OrderedCollection new.

	faces do: [:face | newFaces addAll: face triangulate ].
	faces := newFaces.