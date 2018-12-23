convert
textureIndexToArray: ti
	|textureArray|

	textureArray := Vector2Array ofSize: ti size.
	1 to: ti size do:[ :i |
		(ti at: i) ifNotNil:[
			textureArray at: i put: (tvertices at: (ti at:i)).]
		ifNil:[
			textureArray at: i put: Vector2 new.].
		].
	^ textureArray.