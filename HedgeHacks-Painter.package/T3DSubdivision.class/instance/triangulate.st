private
triangulate
	"Return the full triangulation of the receiver"
	| firstPoly poly |
	"Create the triangle list"
	firstPoly := self createPolygons.
	poly := firstPoly.
	[poly == nil] whileFalse:[
		poly buildTerminalFan.
		poly := poly next].
	^firstPoly