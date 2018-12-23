transform
orientation: mat
"This is used to set just the orientation part of the matrix. It keeps the translation parts intact."
	| trans |
	trans := self translation.
	localTransform := mat shallowCopy.
	self translation: trans.
	self frameChanged.
	^ localTransform.