render
enableClipPlane: ogl
	
"------ enableClipPlane is used to clip the TSpace to the front face of the portal. This ensures that objects don't get rendered in front of the portal, which would look bad and be confusing.------"
	| equation ov |

"------ We need to do it this way, because Squeak does not directly support doubles and gllClipPlane requires an array of same. ------"
	ov := self clipPlane.
	equation := ExternalData fromHandle: (ExternalAddress allocate: 8*4) type:ExternalType double.
	
	equation getHandle doubleAt: 1 put: ov x.
	equation getHandle doubleAt: 9 put: ov y.
	equation getHandle doubleAt: 17 put: ov z.
	equation getHandle doubleAt: 25 put: 0.0.

	ogl
		glPushMatrix;
		glMultTransposeMatrixf: self globalTransform;

		glClipPlane: GLClipPlane0 with: equation;


		glEnable: GLClipPlane0;

		glPopMatrix.
	equation free.