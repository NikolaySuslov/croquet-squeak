accessing
uvScale: aPoint
	"Set the scale for texture coordinates"
	uvScale := aPoint asPoint.
	self computeTextureMatrix.