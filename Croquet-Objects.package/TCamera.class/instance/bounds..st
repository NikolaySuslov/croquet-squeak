accessing
bounds:bnds

	| radians |

	bounds := bnds.
	radians := (viewAngle/2.0)*(Float pi/180.0).
	zScreen := (bounds height/2.0) / (radians tan).
	cornerVector := ((bounds width/2.0)@(bounds height/2.0)@(zScreen negated)) normalized.
	self reinitialize.