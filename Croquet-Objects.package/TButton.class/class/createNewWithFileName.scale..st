initialize
createNewWithFileName: fName scale: scl

	| tframe |
		tframe := (TLoad3DSMax new initializeWithFileName:  fName scale: scl) frame.
		tframe boundsDepth: 1.
		tframe initBounds.
"		TExporter export: tframe asBinary:url."
		tframe do:[ :tf |
			tf isMesh ifTrue:[ tf materialList do:[ :ml |
				ml ambientColor: #(0.2 0.5 1.0 0.8).
				ml diffuseColor:#(0.2 0.5 1.0 0.8).
				ml textureMode: GLModulate.
				].
			tf checkAlpha.
			].
		].
	^ tframe.
