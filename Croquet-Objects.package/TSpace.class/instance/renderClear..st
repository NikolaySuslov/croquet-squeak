render
renderClear: ogl

	ogl glClearColor: (color at: 1) with: (color at: 2) with: (color at: 3) with: (color at: 4).
	ogl glClear: (GLColorBufferBit bitOr: (GLDepthBufferBit bitOr: GLStencilBufferBit)).
