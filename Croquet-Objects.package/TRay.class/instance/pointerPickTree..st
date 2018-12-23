picking
pointerPickTree: frame

	| rval trans |

	frame = excludeFrame ifTrue: [ ^ false ].

	rval := false.
	trans := self selectedCameraTransform.
	(frame visible & frame isSolid) ifTrue:[(self pointerPick: frame boundSphere) ifTrue:[ rval := true].].
	frame frameChildren ifNotNil:[
		frame frameChildren do:[ :fc | (self pointerPickTree: fc) ifTrue:[rval := true.].].].
	self selectedCameraTransform: trans.
	^ rval.