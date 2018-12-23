accessing
computeTextureMatrix
	(uvAngle = 0.0 and:[uvOffset = 0.0 and:[uvScale x = 1.0 and:[uvScale y = 1.0]]])
		ifTrue:[^textureMatrix := nil].
	textureMatrix := Matrix4x4 identity.
	textureMatrix rotationAroundZ: uvAngle.
	textureMatrix scaling: (Vector3 x: uvScale x y: uvScale y z: 1.0).
	textureMatrix translation: (Vector3 x: uvOffset x y: uvOffset y z: 0.0).
	^textureMatrix