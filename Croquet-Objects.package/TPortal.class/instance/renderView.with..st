render
renderView: ogl with: systemOverlays

	| rval vwpnt |
	postcard ifNil:[^0].
	postcard ~= self ifTrue:[
		vwpnt := postcard resolveViewpoint: ogl.
		vwpnt ifNil:[^ 0 ].
		ogl camera currentPortal: self.
		rval := vwpnt renderView:ogl overlay:(overlays,systemOverlays).
		ogl camera currentPortal: nil.
	].
	^ rval.