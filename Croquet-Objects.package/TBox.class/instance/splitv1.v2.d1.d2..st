private
splitv1:v1 v2:v2 d1:d1 d2:d2

	| vx dx |
	vx:= v2-v1.
	dx := d1+d2.
	^ v1+(vx*d1/dx)