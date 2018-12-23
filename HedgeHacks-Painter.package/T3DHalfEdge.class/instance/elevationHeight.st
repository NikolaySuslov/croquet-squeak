accessing
elevationHeight
	| height center |
	height := self length * 0.5.
	fanVertices ifNotNil:[
		center := self center.
		fanVertices do:[:v| height := height + (v dist: center)].
		height := height / (fanVertices size + 1) asFloat].
	^height