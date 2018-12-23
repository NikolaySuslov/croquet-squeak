initialize
setup

	isPremultiplied := false.
	baseScale := 0.02.
	extent := tform extent * baseScale.
	self aspectFixed: true.
	self aspect: (extent y/extent x) asFloat.
	self texture: self.
"	extent := extent * baseScale." 	"save the original value if we have to render this object."
	self objectName: tform url copy.
