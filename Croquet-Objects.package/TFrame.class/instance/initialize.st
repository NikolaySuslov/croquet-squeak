initialize
initialize
	super initialize.
	frameChanged := true. 
	localTransform := Matrix4x4 identity.
	globalTransform := Matrix4x4 identity.
	frameChildren := nil.
	frameRoot := nil.
	eventMask := EventNone.
	self solid: true.
	self visible: true.
	objectOwner := self.
	objectID := TObjectID for: self.
	objectName := 'a', self class asString.
	self register.
	test := nil.
	^self
