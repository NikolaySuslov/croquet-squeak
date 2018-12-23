accessing
scale: sc

	baseScale := baseScale * sc.
	self translation: (self translation * sc).
	extent := tform extent * baseScale. 	"save the original value if we have to render this object."
	self boundsChanged.
