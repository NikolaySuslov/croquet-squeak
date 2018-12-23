render
renderAlpha: ogl

	| tx ty ttx tty vx vy vvx vvvx vvy tcount bcount |

" This first renders the base texture, then it renders the environment map on the disturbed surface. If the surface has not been touched in 300 cycles, we can assume that it has calmed sufficiently so that we can just re-render the rectangle with the environment map on it instead of the entire grid."
(countDown ~= 0) ifTrue:[
	envTexture ifNotNil:[envTexture enable: ogl.].
	matWater enable: ogl.
	ogl glPushAttrib: GLTextureBit;
		glTexEnvf: GLTextureEnv with: GLTextureEnvMode with: GLDecal;
		glTexGeni: GLS with: GLTextureGenMode with: GLSphereMap;
		glTexGeni: GLT with: GLTextureGenMode with: GLSphereMap;
		glEnable: GLTextureGenS;
		glEnable: GLTextureGenT.
	tx := 1.0/(size x - 1).
	ty := -1.0/(size y - 1).
	vvvx := location x - (self extent x/2.0).
	vvy := location y - (self extent y/2.0).
	vx := self extent x/(size x -1)asFloat.
	vy := self extent y/(size y -1)asFloat.
	tty := 0.0.
	tcount := 1.
	bcount := tcount+size x.
	ogl glEnable: GLNormalize.
	size y -1 timesRepeat:[
		ogl glBegin: GLTriangleStrip.
		ttx := 0.0.
		vvx := vvvx.
		size x timesRepeat:[
			ogl glTexCoord2f: ttx with: tty+ty;
				glNormal3f: (fVert at: bcount) with: (fHorz at: bcount) with: 1.0;
				glVertex3f: vvx with: vvy + vy with: (surface at: bcount);

				glTexCoord2f: ttx with: tty;
				glNormal3f: (fVert at: tcount) with: (fHorz at: tcount) with: 1.0;
				glVertex3f: vvx with: vvy with: (surface at: tcount).

			ttx := ttx + tx.
			vvx := vvx + vx.
			tcount := tcount+1.
			bcount := bcount+1.
			].
		ogl glEnd.
		tty := tty + ty.
		vvy := vvy + vy.
		].
	ogl glDisable: GLNormalize.
	matWater disable: ogl.
	ogl glPopAttrib. 
	envTexture ifNotNil:[envTexture disable: ogl.].
]ifFalse:[super renderAlpha: ogl.].
