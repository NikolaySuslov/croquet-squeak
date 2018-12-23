render
regenerate: index

	| lt |
	lt := lifetimeRange atRandom asFloat.
	pLifetime at: index put: lt.
	pPosition at: index put: (tpr atRandom: 1000)+self globalPosition.
	pLastPosition at: index put: (pPosition at: index).
	pVelocity at: index put: (tvr atRandom: 1000)+globalVelocity.
	pAcceleration at: index put: (tar atRandom: 1000).
	pColor ifNotNil:[
		pColor at: index put: startColor.
		pDeltaColor at: index put: (startColor - endColor)/lt.
		].

"
	a := Float pi*(500-(1000 atRandom))/500.0.

	x := a cos.
	z := a sin.

	a := Float pi*(500-(1000 atRandom))/1000.0.
	x2 := a cos.
	gp := (attractors at: 1) globalPosition.
	r:=1.0+(attractors at:1)radius.
	x:= x*x2*r.
	y := a sin*r.
	z:= z*x2*r.
	pPosition at: index put:gp+(x@y@z).
"
	