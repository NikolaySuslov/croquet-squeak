accessing
globalMatrixOut
" This simply reverses the direction of the matrix. An example of use is for TPortals, where the global matrix used for rendering the outside of the portal is the reverse of the exiting render, hence we need to flip the matrix around to get what we want."

	| gt |
	gt := self globalTransform copy.
	gt a11: 0.0 - gt a11.
	gt a21: 0.0 - gt a21.
	gt a31: 0.0 - gt a31.
	gt a13: 0.0 - gt a13.
	gt a23: 0.0 - gt a23.
	gt a33: 0.0 - gt a33.
	^ gt

