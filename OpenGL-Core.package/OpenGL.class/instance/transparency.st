accessing
transparency

	forceHilite ifNotNil: [
		^ forceHilite alpha * transparency.
	].

	^ transparency.