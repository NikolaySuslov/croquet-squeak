convert
vertexIndexToArray: vi

	| vertexArray |

	vertexArray := Vector3Array ofSize: (vi size).
	1 to: vi size do:[ :i |
		(vi at: i) ifNil:[
			vertexArray at: i put: Vector3 new.]
		ifNotNil:[
			vertexArray at: i put: (vertices at: (vi at: i)).
			].
		].
	^ vertexArray.