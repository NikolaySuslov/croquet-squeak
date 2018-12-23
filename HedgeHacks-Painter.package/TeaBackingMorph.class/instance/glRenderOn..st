rendering
glRenderOn: ogl
	"Update what's dirty and blast out the texture"
	| tw th box mat fakeSHA |
	texture ifNil:[
		fakeSHA := TFormManager generateSHA: (TObjectID for: 'TeaBackingMorph SHA').
		texture := TTexture 
			new initializeWithForm: (Form extent: self extent x asLargerPowerOfTwo @ self extent y asLargerPowerOfTwo depth: 32)
			mipmap: false 
			shrinkFit: true.
		mat := TMaterial new.
		mat ambientColor: #(1.0 1.0 1.0 0.9) asFloatArray.
		mat diffuseColor: #(1.0 1.0 1.0 0.9) asFloatArray.
		mat emissiveColor: #(1.0 1.0 1.0 1.0) asFloatArray.
		texture material: mat.
		texture tform fakeSHA: fakeSHA.
	].
	damageRecorder updateIsNeeded ifTrue:[self repairDamage].
	texture enable: ogl.
	tw := bounds width asFloat / texture targetForm width asFloat.
	th := bounds height asFloat / texture targetForm height asFloat.
	box := bounds translateBy: owner bounds origin negated.
	ogl glDisable: GLLighting.
	ogl glColor4f: 1.0 with: 1.0 with: 1.0 with: 1.0.
	ogl glBegin: GLQuads;
		glTexCoord2f: 0.0 with: 0.0;
		glVertex2f: box left with: box top;

		glTexCoord2f: tw with: 0.0;
		glVertex2f: box right with: box top;

		glTexCoord2f: tw with: th;
		glVertex2f: box right with: box bottom;

		glTexCoord2f: 0.0 with: th;
		glVertex2f: box left with: box bottom;

		glEnd.
	texture disable: ogl.
