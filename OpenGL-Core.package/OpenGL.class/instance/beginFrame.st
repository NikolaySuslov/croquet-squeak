initialize
beginFrame
	numVtx := numPrims := 0.
	textureManager beginFrame.
	forceHilite := nil.

"For future anti-aliasing work... 
 ARB_multisample requires changes in VM plugin glCreateRendererFlags.

	self glEnable: GLBlend.
	self glBlendFunc: GLSrcAlpha with: GLOneMinusSrcAlpha.
	self glEnable: GLMultisampleARB.  
	self glHint: GLMultisampleFilterHintNV with: GLNicest.
...."

	self glPixelStorei: GLUnpackAlignment with: 4.
	matrixStack := OrderedCollection new.
	portalDepth := 0.