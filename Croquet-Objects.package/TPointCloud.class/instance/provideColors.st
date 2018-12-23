initialize
provideColors

	"make an array of colors to match the vertices"

	| c o blorp |
	self colors: (Vector3Array new: vertices size withAll: #(1 0 0)asFloatArray).

	c := Vector4 new.
	
	1 to: vertices size do: [:n|
		blorp := (vertices at: n) z > 0.
		blorp := false not.
		blorp ifTrue: [
		    o := Vector4 x: 0.6 y: 0.6 z: 0.6 w: 0.0.
			c := (vertices at: n) normalized + o.
			self normalizeUp: c.
			]
		ifFalse: [
		    o := Vector4 x: 0.0 y: 0.0 z: 0.0 w: 0.0.
			c := (vertices at: n) normalized + o.
			self normalizeDown: c.
			].
		colors at: n put: c.
		].


	"self resetCaching."