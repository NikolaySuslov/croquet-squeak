actions
scaleBox: pointer

	| mn fc sp mnBase scl |
	sp := pointer selectedPoint abs.	
	selectedPoint := selectedPoint abs.
	mn := sp x min: sp y.
	mnBase := selectedPoint x min: selectedPoint y.
	scl := mn/mnBase.
	newScale := scl * newScale.
	newScale < 0.1 ifTrue:[newScale := 0.1].
	selectedPoint := sp.
	fc := selectedFrame frameChildren.
	1 to: 8 do:[:index | (fc at: index) translation: (basePosition at: index) *newScale.].
	deferScale ifFalse:[contents scale: baseScale *newScale].
	^ true.
