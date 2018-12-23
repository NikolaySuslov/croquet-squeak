render
renderFrame: ogl

	| len lastTr rval ep|
	len := (self globalPosition - ogl camera globalPosition)squaredLength.
	lastTr := ogl transparency.
	len >10.0 ifTrue:[ogl transparency:1.0]ifFalse:[
		ogl transparency: len/25.0.].
	ep := ogl eventPointer.
	carrying ifNotNil:[carrying eventPointer: ep].
	ogl eventPointer:nil.
	rval := super renderFrame: ogl.
	ogl eventPointer: ep.
	carrying ifNotNil: [carrying eventPointer: nil].
	ogl transparency: lastTr.
	^ rval.