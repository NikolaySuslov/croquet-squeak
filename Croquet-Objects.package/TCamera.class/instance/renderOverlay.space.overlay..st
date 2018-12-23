render
renderOverlay: ogl space: space overlay: overlays

	| rval  lastTarget lastDistance |
	ogl glEnable: GLDepthTest.
	ogl glEnable: GLLighting.
	"------ set up the view frustum if necessary ------"
	ogl camera ~= self ifTrue:[
		ogl camera: self.
		self initFrustum: ogl. 
		].

	space renderClearBounds: ogl.
	ogl eventPointer ifNotNil:[
		lastTarget := ogl eventPointer selectedTarget.
		lastDistance := ogl eventPointer selectedDistance.
		ogl eventPointer selectedDistance: Float infinity.
		rval := space renderSpace: ogl.
		ogl eventPointer selectedTarget = lastTarget ifTrue:[
			ogl eventPointer selectedDistance: lastDistance.
			ogl eventPointer isOverlay: false.
		] ifFalse:[ ogl eventPointer isOverlay: true.].
	] ifNil:[
		rval := space renderSpace: ogl.
	].
	self globalTransform: Matrix4x4 identity.
	rval := rval + (self renderOverlay: ogl with: overlays).
	^ rval.