transform
globalMatrixOut
" This simply reverses the direction of the matrix for TPortals (see TPortal>>#globalMatrixOut). Otherwise, we just use the globalTransform."

	^self globalTransform copy.
