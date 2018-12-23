accessing
transformedBy: aTransform
	"Answer a box transformed by the given transformation"
	| aVertex min max |
	min := max := nil.
	self cornerVerticesDo:[:vtx| 
		aVertex := aTransform localPointToGlobal: vtx.
		min ifNil:[
			min := max := aVertex.
		] ifNotNil:[
			min := min min: aVertex.
			max := max max: aVertex.
		].
	].
	^TBox origin: min corner: max