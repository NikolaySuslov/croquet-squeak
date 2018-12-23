instance creation
red: r green: g blue: b 
	"Create an initialize a color vector."

	| newColor |
	newColor := VectorColor3 new.

	newColor red: r.
	newColor green: g.
	newColor blue: b.

	^ newColor.
