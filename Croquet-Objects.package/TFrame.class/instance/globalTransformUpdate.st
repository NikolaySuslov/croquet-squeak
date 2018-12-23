transform
globalTransformUpdate

	" This is called when a new global transfom is calculated. It is designed to be extended by other frame sub-classes, such as TRigidBody, that would have variables that should be updated once when the frame gets changed."
	self boundSphere ifNotNil:[ self boundSphere transform: globalTransform.].
