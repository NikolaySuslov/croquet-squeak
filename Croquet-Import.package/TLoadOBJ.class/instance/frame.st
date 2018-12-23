accessing
frame
	^ frame ifNil: [ frame := self buildMesh ]