solving
solveLU: aVector
	"Given a decomposed matrix using gaussian elimination solve the linear equations."
	| x v |
	v := Array with: aVector x with: aVector y with: aVector z with: aVector w.
	"L first"
	1 to: 4 do:[:i| "Top to bottom"
		x := 0.0.
		1 to: i-1 do:[:j|
			"From left to right w/o diagonal element"
			x := x + ((v at: j) * (self at: i at: j))].
		"No need to divide by the diagonal element - this is always 1.0 in L"
		v at: i put: (v at: i) - x].
	"Now U"
	4 to: 1 by: -1 do:[:i| "Bottom to top"
		x := 0.0.
		4 to: i+1 by: -1 do:[:j|
			"From right to left w/o diagonal element"
			x := x + ((v at: j) * (self at: i at: j))].
		"Divide by diagonal element"
		v at: i put: (v at: i) - x / (self at: i at: i)].
	^Vector4 x: (v at: 1) y: (v at: 2) z: (v at: 3) w: (v at: 4)
