library
scrollBack: aScroller
	aScroller hasSubmorphs ifFalse:[^self].
	aScroller offset: ((aScroller offset x - 68 max: 0) truncateTo: 68) @ 0.