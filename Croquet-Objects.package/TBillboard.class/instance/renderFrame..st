render
renderFrame: ogl 

	self lookAt: ogl camera up: nil.
	^super renderFrame: ogl.
