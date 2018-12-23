accessing
cornerVertices
	"Answer all the vertices defining the corners of this block"
	| out |
	out := (WriteStream on: (Array new: 8)).
	self cornerVerticesDo:[:vtx| out nextPut: vtx].
	^out contents