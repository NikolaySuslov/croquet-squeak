render
renderPrimitive: ogl

	vertices ifNil: [^super renderPrimitive: ogl].

	ogl glPointSize: pointSize. 

	ogl glEnableClientState: GLVertexArray.

	normals ifNil: [
		ogl glDisable: GLLighting.
		]
	ifNotNil: [
		ogl glEnableClientState: GLNormalArray.
		ogl glNormalPointer:         GLFloat with: 0 with: normals.
		].

	ogl glVertexPointer: 3 with: GLFloat with: 0 with: vertices.
	colors ifNotNil: [
		ogl glEnableClientState: GLColorArray.
		ogl glEnable: GLColorMaterial.
		ogl glColorPointer:  3 with: GLFloat with: 0 with: colors.
		].

	ogl glDrawArrays: GLPoints with: 0 with: vertices size.

	"clean up"
	ogl glDisableClientState: GLColorArray.
	ogl glDisableClientState: GLNormalArray.
	ogl glDisableClientState: GLVertexArray.
	ogl glColor3fv: #(1 1 1)asFloatArray.
	ogl glEnable: GLLighting.
	ogl glDisable: GLColorMaterial.

