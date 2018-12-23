render
renderView: ogl space: space overlay: overlays

	| rval |
	self preRender.
	ogl glEnable: GLDepthTest.
	ogl beginFrame.
	ogl glEnable: GLLighting.
	"------ set up the view frustum if necessary ------"
	ogl camera ~= self ifTrue:[
		ogl camera: self.
		self initFrustum: ogl. 
	].
	space renderClearAll: ogl.
	rval := space renderSpace: ogl.
	self globalTransform: Matrix4x4 identity.
	rval := rval + (self renderOverlay: ogl with: overlays).
	ogl endFrame.
	self postRender.
	^ rval.