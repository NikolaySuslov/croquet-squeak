initialize
initialize

	super initialize.
	viewAngle := 45.0.
	zNear := 0.5.
	zScreen := 0.5. "give it any value - initFrustum gives it a real value"
	zFar := 1500.0.
	localTransform := Matrix4x4 identity.
	viewClip := true.
	currentPortal := nil.
	killFrame := false.
	self visible: false.
	portalClip := nil.
	self frameScale: 1.0.
