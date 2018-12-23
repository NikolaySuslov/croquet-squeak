future sends
renderAsOverlay: ogl

	^ self send:[ :vp | vp renderAsOverlay: ogl.].
