initialize
initFrustum: ogl

	ogl initFrustum: viewAngle bounds: bounds zNear: zNear zFar: zFar.
	self frustumChanged.
