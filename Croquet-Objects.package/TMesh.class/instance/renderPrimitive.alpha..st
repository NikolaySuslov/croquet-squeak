render
renderPrimitive: ogl alpha: alphaPass
	| lastMat nextMat |
	lastMat := nil.

	ogl beginVertices: self vertices normals: self normals colors: self colors texCoords: self texCoords.

	1 to: faceGroups size by: 2 do:[ :i |
		nextMat := materialList at: (faceGroups at: i).
		nextMat hasAlpha = alphaPass ifTrue:[
			nextMat == lastMat ifFalse:[
				lastMat ifNotNil:[lastMat disable: ogl].
				nextMat enable: ogl.
				lastMat := nextMat.
			].
			ogl drawIndexed: mode faces: (faceBuffers at: i+1//2).
		].
	].
	lastMat ifNotNil:[lastMat disable: ogl].
	ogl end.

"	boundSphere renderBox: self."