render
bounds: bnds subBounds: sbnds
	
	| sbounds |
	ogl ifNil:[
		ogl := OpenGL newIn: bnds. 	
		ogl harness: self.
		ogl formManager: TFormManager default.
	] ifNotNil:[ ogl := ogl bufferRect: bnds. ].

	bounds := bnds  translateBy: bnds origin negated.
	sbounds := sbnds  translateBy: sbnds origin negated.
	ogl camera: TCamera new.
	ogl avatar: avatar.
	ogl camera bounds: bounds.
	ogl camera subBounds: sbounds.
	ogl camera initFrustum: ogl.
	eventPointer parent: ogl camera.
	viewPortal ifNotNil:[viewPortal send:[ :vp | vp bounds: bounds.]].
	systemOverlayPortal ifNotNil:[systemOverlayPortal send:[ :so | (so resolveViewpoint:ogl) send:[ :spc | spc bounds: bounds.].].].