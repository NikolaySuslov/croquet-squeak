render
renderSpaceAlpha: ogl transform: currentCamTrans
	
	| saveTrans |

	ogl glPushMatrix.
	ogl glMultTransposeMatrixf: currentCamTrans.
	self setupAlpha: ogl.
"------ Sort the alphaObjects by distance - furthest first ------"
	saveTrans := ogl transparency.
	(alphaObjects asArray sort:[:a1 :a2|  a1 distance > a2 distance]) do: [:aObject | 
		ogl glPushMatrix.
		aObject transform ifNotNil:[
			ogl glMultMatrixf: aObject transform.].
		ogl transparency: aObject transparency.
		aObject tObject doRenderAlpha: ogl.
		ogl glPopMatrix.
		].
	ogl transparency: saveTrans.
"------ Set render mode back to original state. ------"
	ogl glPopMatrix.
	self restoreFromAlpha: ogl.
