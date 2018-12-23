updating
invalidate: aRectangle
	aRectangle area > 0 ifTrue: [
		updateRect := updateRect ifNil: [aRectangle]
			ifNotNil: [updateRect quickMerge: aRectangle]].
