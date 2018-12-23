render
doRenderColor: ogl
	
	| secs transfer go |

	doStep ifFalse:[^ self].

	material enable: ogl.

	ogl glPointSize: 2.0. 
	ogl glPushMatrix.
	ogl glMultMatrixf: self globalTransform orthoNormInverse transposed.
	pLifetime -= deltaTime.
	secs := deltaTime/1000.0.
	secs := secs min: 0.1.
	attractors size > 0 ifTrue:[self doAttractors: secs].
	pPosition replaceFrom: 1 to: pPosition size with: pLastPosition startingAt: 1.
	pPosition += (pVelocity * secs).
	pVelocity += (pAcceleration * secs).
	go := self globalOrientation.
	tpr := go localBoxToGlobal: positionRange.
	tvr := go localBoxToGlobal: velocityRange.
	tar := go localBoxToGlobal: accelerationRange.
	pColor -= pDeltaColor*deltaTime.
	ogl glLineWidth: 2.0.
	ogl glBegin: GLLines.
	1 to: size do:[:index |
		ogl	glColor3fv: (pColor at: index);
			glVertex3fv: (pPosition at: index);
			glVertex3fv:(pLastPosition at: index).
		].
	ogl glEnd.
"Transcript show: (self globalOrientation orthoNormInverse localPointToGlobal:globalVelocity); cr.
"	ogl glLineWidth: 2.0.
	material disable: ogl.
	transfer := pPosition.
	pPosition := pLastPosition.
	pLastPosition := transfer.
	ogl glPopMatrix.
