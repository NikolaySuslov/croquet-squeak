render
renderAsOverlay: ogl

	| rval cp vwPnt |

	postcard ~= self ifTrue:[
		cp := ogl camera currentPortal.
		ogl camera currentPortal: self.
		vwPnt := postcard resolveViewpoint: ogl.
		rval := vwPnt send:[:vp | vp renderOverlay: ogl overlay: overlays.].
		ogl camera currentPortal: cp.
		].
	^ rval.