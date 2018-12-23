accessing
bounds
	^form ifNil:[self defaultBounds] ifNotNil:[0@0 extent: form extent].