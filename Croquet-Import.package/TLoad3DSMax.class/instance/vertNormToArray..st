convert
vertNormToArray: vi

	| vertexNormals |

	vertexNormals := Vector3Array ofSize: vi size.
	1 to: vi size do:[ :i |
		(vi at: i) ifNil:[
			vertexNormals at: i put: (Vector3 new).]
		ifNotNil:[
			vertexNormals at: i put: (vi at: i).].
		].
	^ vertexNormals.
			
		