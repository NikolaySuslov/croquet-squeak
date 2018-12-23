actions
moveBox: pointer

	| delta |
	delta := pointer selectedPoint - selectedPoint.
"delta is currently defined in terms of the selectedFrame - need to convert to this frame"
	delta := selectedFrame orientation localPointToGlobal: delta.
	selectedFrame translation: selectedFrame translation + delta.
	contents offset: (contents offset - (delta/contents scale)).
	^ true.
