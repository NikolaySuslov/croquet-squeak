transform
rotFromBallPoints: from to: to
 |  f t |
" This matrix needs to be transposed to convert from left handed to right (which is OpenGL's world)."
	f := from normalized.
	t := to normalized.
	f := (f+t) normalized.
	f := (f+t) normalized.
	^  (Quaternion 	a: (f x * t x) + (f y * t y) + (f z * t z )
				b: (f y * t z) - (f z * t y)
			  	c: (f z * t x) - (f x * t z)
			  	d: (f x * t y) - (f y * t x)
			  	).