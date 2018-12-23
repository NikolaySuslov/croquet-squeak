render
renderAlpha: ogl
"	| mat |

	ogl glDisable: GLCullFace.
	mat := TMaterial initialize: cWorld.
	mat ambientColor: #(0.7  0.2 0.1 0.3)asFloatArray.
	mat diffuseColor: #(0.7  0.2 0.1 0.3)asFloatArray.
	mat enable: ogl.
	ogl renderBox: box.
	qtTL ifNotNil:[ qtTL renderAlpha: ogl.].
	qtTR ifNotNil:[ qtTR renderAlpha: ogl.].
	qtBL ifNotNil:[ qtBL renderAlpha: ogl.].
	qtBR ifNotNil:[ qtBR renderAlpha: ogl.].
	ogl setCull."