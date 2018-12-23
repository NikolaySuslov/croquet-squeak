render
renderSubspace: ogl
"Completely render a space as if it is a single TFrame. This is used by the TPortal3D."
	| rval globalTrans |

	self pushAlphaObjects. "if we are in the middle of rendering this same world"
	rval := 0.
	rval := self renderFrame: ogl.

	self hasAlphaObjectsToRender ifTrue:[
		globalTrans := Matrix4x4 new.
		ogl glGetFloatv: GLModelviewMatrix with: globalTrans.
		globalTrans := globalTrans transposed.
		ogl glLoadMatrixf: globalTrans  transposed.
		self renderSpaceAlpha: ogl transform: (globalTrans inverseTransformation). 
		].
	self popAlphaObjects.
	^ rval.