accessing
sideScale: factor

	"Set the scaling factor applied to the control handles.
      10.0 is the default value; larger values make smaller handles."

	factor <= 0 ifTrue: [
		self error: 'TScrollBox3D control scale must be positive.'.
	] ifFalse: [
		sideScale := factor.
	].