fileIn/out
exportOnIslandCopier: copier
	| mfr result |
	[mfr := myFarRef.
	myFarRef := nil.
	result := super exportOnIslandCopier: copier] ensure: [myFarRef := mfr].
	^ result