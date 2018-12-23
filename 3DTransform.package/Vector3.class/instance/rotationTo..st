vector functions
rotationTo: aVector 
	"calculate the rotation matrix that rotates this vector into aVector. From 'Real-Time Rendering' by Moller and Haines, pgs. 50-52."
| m v e h s t |
	s := self normalized.
	t := aVector normalized.
	v := s cross: t.
	e := s dot: t.
	h := (1-e)/(v dot: v).
	m := Matrix4x4 new.
	m a11: e + (h * v x * v x).
	m a12: (h * v x * v y) - v z.
	m a13: (h * v x * v z) + v y.
	m a21: (h * v x * v y) + v z.
	m a22: e + (h * v y * v y).
	m a23: (h * v y * v z) - v x.
	m a31: (h * v x * v z) - v y.
	m a32: (h * v y * v z) + v x.
	m a33: e + (h * v z * v z).
	m a44: 1.0.
	^ m
