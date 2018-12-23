windows
makeWidget: uri scale: scl

	| frame fileName |
	fileName := FileDirectory pathFromURI: uri.
	frame := (TLoad3DSMax new initializeWithFileName: fileName scale: scl) frame.
	frame boundsDepth: 1.
	frame initBounds.
	frame do:[ :tf |
		tf isMesh ifTrue:[ tf materialList do:[ :ml |
			ml ambientColor: #(0.2 0.5 1.0 0.8).
			ml diffuseColor:#(0.2 0.5 1.0 0.8).
			ml textureMode: GLModulate.
		]].
		tf checkAlpha.
	].
	^frame