render
renderOverlay: ogl overlay: ov

	| gTrans rval |
	ogl camera globalTransform: self globalMatrixOut.
	ogl eventPointer ifNotNil:[
		gTrans := ogl eventPointer globalTransform.
		ogl eventPointer globalTransform: self globalMatrixOut * ogl eventPointer localTransform.
	rval := ogl camera renderOverlay: ogl space: self root overlay: ov.
		ogl eventPointer globalTransform: gTrans.
	] ifNil: [	rval := ogl camera renderOverlay: ogl space: self root overlay: ov.].
	^ rval.