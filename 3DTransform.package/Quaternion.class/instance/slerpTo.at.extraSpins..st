interpolating
slerpTo: aRotation at: t extraSpins: spin
	"Sperical Linear Interpolation (slerp).
	Calculate the new quaternion when applying slerp from the receiver (t = 0.0)
	to aRotation (t = 1.0). spin indicates the number of extra rotations to be added.
	The code shown below is from Graphics Gems III"
	| cosT alpha beta flip theta phi sinT |
	alpha := t.
	flip := false.
	"calculate the cosine of the two quaternions on the 4d sphere"
	cosT := self dot: aRotation.
	"if aQuaternion is on the opposite hemisphere reverse the direction
	(note that in quaternion space two points describe the same rotation)"
	cosT < 0.0 ifTrue:[
		flip := true.
		cosT := cosT negated].
	"If the aQuaternion is nearly the same as I am use linear interpolation"
	cosT > 0.99999 ifTrue:[
		"Linear Interpolation"
		beta := 1.0 - alpha
	] ifFalse:[
		"Spherical Interpolation"
		theta := cosT arcCos.
		phi := (spin * Float pi) + theta.
		sinT := theta sin.
		beta := (theta - (alpha * phi)) sin / sinT.
		alpha := (alpha * phi) sin / sinT].

	flip ifTrue:[alpha := alpha negated].
	^Quaternion 
		a: (alpha * aRotation a) + (beta * self a)
		b: (alpha * aRotation b) + (beta * self b)
		c: (alpha * aRotation c) + (beta * self c)
		d: (alpha * aRotation d) + (beta * self d)