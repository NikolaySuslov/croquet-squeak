render
setupAlpha: ogl

	ogl glEnable: GLBlend.
	ogl glDepthMask: GLFalse. " set depth buffer to read only. "
	ogl glBlendFunc: GLSrcAlpha with: GLOneMinusSrcAlpha.
