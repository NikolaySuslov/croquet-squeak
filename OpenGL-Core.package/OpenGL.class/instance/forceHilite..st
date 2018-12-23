accessing
forceHilite: aColor

	"Install the given color to force hiliting until cleared.
       Return true if accepted, false if the hilite state has already been set."

	aColor ifNotNil: [
		forceHilite ifNil: [
			forceHilite := aColor.
			^ true.
		] ifNotNil: [
			^ false.
		].
	] ifNil: [
		forceHilite ifNil: [
			^ false.
		] ifNotNil: [
			forceHilite := nil.
			^ true.
		].
	].