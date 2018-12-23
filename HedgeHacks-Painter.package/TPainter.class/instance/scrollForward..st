library
scrollForward: aScroller
	aScroller hasSubmorphs ifFalse:[^self].
	aScroller offset: (aScroller offset x + 68 min: aScroller submorphBounds width) @ 0.