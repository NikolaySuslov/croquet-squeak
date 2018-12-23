accessing
addPath: pos

	path add: pos.
	path size > maxSize ifTrue:[path removeFirst].