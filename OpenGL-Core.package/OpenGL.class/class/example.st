example
example	"OpenGL example"
	"A very simple OpenGL example"

	| ogl frames startTime deltaTime framesPerSec bounds font |
	font := StrikeFont familyName: 'Atlanta' pointSize: 11.
	bounds := 0@0 extent: 400@400.
	ogl := OpenGL newIn: bounds.
	ogl ifNil:[^self error: 'Unable to create renderer'].
	[frames := 0.
	startTime := Time millisecondClockValue.
	[Sensor anyButtonPressed] whileFalse:[
		"start counting at second frame since first frame is penalized
		by the upload of the bitmap font outside of ogl."
		frames = 1 ifTrue:[startTime := Time millisecondClockValue].
		ogl beginFrame.

	"--- this is the actual scene content ---"

		ogl glDisable: GLDepthTest.	"for the simple example only"
		ogl glDisable: GLLighting.		"for the simple example only"

		ogl glClearColor: 1.0 with: 1.0 with: 1.0 with: 1.0.
		ogl glClear: GLColorBufferBit.

		ogl glRotatef: 5.0 with: 0.0 with: 0.0 with: 1.0.
		ogl glColor3f: 1.0 with: 0.0 with: 0.0.

		ogl glBegin: GLPolygon.
			ogl glVertex2f: -0.7 with: -0.7.
			ogl glVertex2f:  0.7 with: -0.7.
			ogl glVertex2f:  0.7 with:  0.7.
			ogl glVertex2f: -0.7 with:  0.7.
		ogl glEnd.

	"--- here is the 2d overlay setup ---"

		ogl glMatrixMode: GLProjection.
		ogl glPushMatrix.
		ogl glLoadIdentity.
		ogl glMatrixMode: GLModelview.
		ogl glPushMatrix.
		ogl glLoadIdentity.
		ogl glTranslated: -1 with: 1 with: 0.0.
		ogl glScaled: (2.0 / bounds width) with: (-2.0 / bounds height) with: 1.0.
		ogl glDisable: GLDepthTest.
		ogl glEnable: GLBlend.
		ogl glBlendFunc: GLOne with: GLOneMinusSrcAlpha.

	"--- here is the 2d overlay rendering ---"
		deltaTime := Time millisecondsSince: startTime.
		framesPerSec := frames * 1000 / (deltaTime max: 1) asFloat.
		
		"@@@@: Fixme. It appears as if #drawString: depends on glColor being set.
		Makes no sense but I'm not going to figure this out - probably some mishap
		wrt. GLLighting being disabled."
		ogl glColor3f: 0.0 with: 0.0 with: 0.0.
		ogl drawString: frames printString, ' frames: ', (framesPerSec truncateTo: 0.1), ' fps'
			at: 0@font height@0 font: font color: Color black.

		ogl glDisable: GLBlend.
		ogl glMatrixMode: GLModelview.
		ogl glPopMatrix.
		ogl glMatrixMode: GLProjection.
		ogl glPopMatrix.
		ogl glMatrixMode: GLModelview.

	"--- end the end frame operations"

		ogl endFrame.
		ogl swapBuffers.
		frames := frames + 1.
	].
	] ensure:[ogl destroy].