accessing
axis
	| sinAngle |
	sinAngle := self a arcCos sin.
	sinAngle isZero ifTrue:[^Vector3 zero].
	^Vector3 
		x: (self b / sinAngle)
		y: (self c / sinAngle)
		z: (self d / sinAngle)