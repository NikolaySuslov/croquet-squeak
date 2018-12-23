accessing
subBounds:bnds

	| radians va zs |
	bnds ifNil:[subCornerVector := nil. ^ self].
	va := (bnds height asFloat/bounds height)*viewAngle.
	radians := (va/2.0)*(Float pi/180.0).
	zs := (bnds height/2.0) / (radians tan).
	subCornerVector := ((bnds width/2.0)@(bnds height/2.0)@(zs negated)) normalized.
