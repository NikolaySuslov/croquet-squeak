render
enableClipPlanes: ogl
	
"------ enableClipPlanes is used to clip the TSpace inside the 3DPortal to a sub-cube inside the portal. This ensures that objects don't get rendered outside of the portal, which would look bad and be confusing.------"
	| equation |

"------ We need to do it this way, because Squeak does not directly support doubles and gllClipPlane requires an array of same. ------"

	equation := ExternalData fromHandle: (ExternalAddress allocate: 8*4) type:ExternalType double.
	
	equation getHandle doubleAt: 1 put:  1.0.
	equation getHandle doubleAt: 9 put: 0.0.
	equation getHandle doubleAt: 17 put: 0.0.
	equation getHandle doubleAt: 25 put: clipBox max x.
	ogl glClipPlane: GLClipPlane1 with: equation.
	ogl glEnable: GLClipPlane1.

	equation getHandle doubleAt: 1 put: -1.0.
	equation getHandle doubleAt: 9 put: 0.0.
	equation getHandle doubleAt: 17 put: 0.0.
	equation getHandle doubleAt: 25 put: clipBox min x negated.
	ogl glClipPlane: GLClipPlane2 with: equation.
	ogl glEnable: GLClipPlane2.

	equation getHandle doubleAt: 1 put: 0.0.
	equation getHandle doubleAt: 9 put: 0.0.
	equation getHandle doubleAt: 17 put: 1.0.
	equation getHandle doubleAt: 25 put: clipBox max z.
	ogl glClipPlane: GLClipPlane3 with: equation.
	ogl glEnable: GLClipPlane3.

	equation getHandle doubleAt: 1 put: 0.0.
	equation getHandle doubleAt: 9 put: 0.0.
	equation getHandle doubleAt: 17 put: -1.0.
	equation getHandle doubleAt: 25 put: clipBox min z negated.
	ogl glClipPlane: GLClipPlane4 with: equation.
	ogl glEnable: GLClipPlane4.

	equation getHandle doubleAt: 1 put: 0.0.
	equation getHandle doubleAt: 9 put: -1.0.
	equation getHandle doubleAt: 17 put: 0.0.
	equation getHandle doubleAt: 25 put: clipBox min y negated.
	ogl glClipPlane: GLClipPlane5 with: equation.
	ogl glEnable: GLClipPlane5.

	"Use clip plane 0 for the bottom, but only if it's available."
	ogl inPortal2D ifFalse:[
		equation getHandle doubleAt: 1 put: 0.0.
		equation getHandle doubleAt: 9 put: 1.0.
		equation getHandle doubleAt: 17 put: 0.0.
		equation getHandle doubleAt: 25 put: clipBox max y.
		ogl glClipPlane: GLClipPlane0 with: equation.
		ogl glEnable: GLClipPlane0.
	].

	equation free.