special ops
+= aColor
	"Add the given color to all the elements in the receiver"
	| r g b a |
	r := aColor red.
	g := aColor green.
	b := aColor blue.
	a := aColor alpha.
	1 to: self basicSize by: 4 do:[:i|
		self floatAt: i put: (self floatAt: i) + r.
		self floatAt: i+1 put: (self floatAt: i+1) + g.
		self floatAt: i+2 put: (self floatAt: i+2) + b.
		self floatAt: i+3 put: (self floatAt: i+3) + a.
	].