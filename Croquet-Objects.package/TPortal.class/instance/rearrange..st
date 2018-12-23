render
rearrange: ogl

" this allows a portal to rearrange itself. Called when a portal is about to be rendered as an overlay. Default to allow the space to rearrange its contents if necessary."

	| vwPnt |
	vwPnt := postcard resolveViewpoint: ogl.
	vwPnt ifNotNil:[
		vwPnt root rearrange: ogl.
	].