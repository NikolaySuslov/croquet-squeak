render
doRenderMonochrome: ogl
	| pt mat yaw  |

	endColor ifNotNil:[^ self doRenderColor: ogl].

	mat := Matrix4x4 identity.
	material enable: ogl.
	billBoard ifTrue:[
		yaw := self globalYaw - ogl camera globalYaw.
		mat rotationAroundY: yaw negated.
		].
	1 to: size do:[:index |
		pt := pTexture at: index.

		mat translation: (pPosition at: index).
		ogl glPushMatrix; 
			glMultMatrixf: mat transposed. 
		pt renderPrimitive: ogl.
		ogl glPopMatrix.
		].
	material disable: ogl.
