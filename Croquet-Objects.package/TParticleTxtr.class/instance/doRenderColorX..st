render
doRenderColorX: ogl
	| mat yaw |

	mat := Matrix4x4 identity.
	material enable: ogl.
	texture enable: ogl.
	billBoard ifTrue:[
		yaw := self globalYaw - ogl camera globalYaw.
		mat rotationAroundY: yaw negated.
		].
	1 to: size do:[:index |
"		pt := pTexture at: index."
		mat translation: (pPosition at: index).
		ogl glPushMatrix. 
		ogl glMultMatrixf: mat transposed. 
		ogl glColor4fv: (pColor at: index).

		rectangle render: ogl.
		ogl glPopMatrix.
	].
	texture disable: ogl.
	material disable: ogl.
