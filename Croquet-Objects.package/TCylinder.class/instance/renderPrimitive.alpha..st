render
renderPrimitive: ogl alpha: alphaPass
	| savedFaceGroups savedNormals |

	super renderPrimitive: ogl alpha: alphaPass.
	
	capFaceGroups ifNil: [^ self].
	"Hackery to render caps"
	[
		savedFaceGroups := faceGroups.
		savedNormals := normalBuffer.
		self faceGroups: capFaceGroups.
		normalBuffer := capNormals.
		mode := GLTriangleFan.
		super renderPrimitive: ogl alpha: alphaPass
	]	 
	ensure: 
	[
		normalBuffer := savedNormals.
		self faceGroups: savedFaceGroups.
		mode := GLTriangleStrip.
	]