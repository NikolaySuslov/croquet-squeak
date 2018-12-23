render
render: ogl depth: depth


	| rval mx lTrans |
	lTrans := localTransform.
	ogl forceWire: ogl forceWire not.
	mx := ogl maxPortalDepth.
	ogl maxPortalDepth: 1.
	rval := super render: ogl depth: depth .
	ogl forceWire: ogl forceWire not.
	ogl maxPortalDepth: mx.
	localTransform := lTrans.
	^ rval.