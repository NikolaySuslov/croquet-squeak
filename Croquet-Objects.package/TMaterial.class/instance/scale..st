accessing
scale: scl

	super scale: scl.
	scale := scl.
	boundSphere ifNotNil:[
		boundSphere := TBoundSphere localPosition:0@0@0 radius: scale.
	].