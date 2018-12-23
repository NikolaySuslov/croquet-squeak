accessing
uvOffset: aPoint
	"Set the offset for u,v coordinates."
	uvOffset := aPoint asPoint.
	self computeTextureMatrix.