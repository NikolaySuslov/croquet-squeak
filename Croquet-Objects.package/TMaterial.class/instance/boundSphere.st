accessing
boundSphere

	boundSphere ifNil:[
		boundSphere := TBoundSphere localPosition: 0@0@0 radius: scale.
		boundSphere frame: self.
	].
	^ boundSphere.