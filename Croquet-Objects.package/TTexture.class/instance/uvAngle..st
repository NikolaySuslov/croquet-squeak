accessing
uvAngle: degrees
	"Set the angle of u,v coordinates"
	uvAngle := degrees.
	self computeTextureMatrix.