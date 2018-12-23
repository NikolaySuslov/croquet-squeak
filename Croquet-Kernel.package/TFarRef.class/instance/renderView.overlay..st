future sends
renderView: ogl overlay: ov

	^ self send:[ :vp | vp renderView: ogl overlay: ov.].
