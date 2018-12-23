render
bounds: bnds
	

	| xform |

	ogl ifNil:[
		ogl := OpenGL newIn: bnds. 	
		ogl ifNil: [self error: 'Cannot initialize OpenGL.' ].
		ogl harness: self.
		ogl formManager: TFormManager default.
	] ifNotNil:[ 
		xform := ogl camera ifNotNil: [ogl camera localTransform.].
		ogl := ogl bufferRect: bnds. 
	].

	bounds := bnds  translateBy: bnds origin negated.
	ogl camera: TCamera new.
	ogl avatar: avatar.
	ogl camera bounds: bounds.
	xform ifNotNil:[ ogl camera localTransform: xform.].
	ogl camera initFrustum: ogl.
	eventPointer parent: ogl camera.
	viewPortal ifNotNil:[viewPortal send:[ :vp | vp bounds: bounds.]].
	systemOverlayPortal ifNotNil:[systemOverlayPortal send:[ :so | (so resolveViewpoint:ogl) send:[ :spc | spc bounds: bounds.].].].
