hierarchy
prune
"
	frameChildren ifNotNil:[
		frameChildren do:[ :fc | fc prune ifTrue:[
			self removeChild: fc.].].
		frameChildren size = 0 ifTrue:[frameChildren := nil].
		].
	(self class = TFrame and:[ frameChildren = nil ])ifTrue:[^true].
	^ false."