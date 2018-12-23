accessing
currentFrame: cf

	| inv |
	inv := cf inverseGlobalTransform.
	self framePosition: (inv localPointToGlobal: self globalPosition).
	self framePointerTrans: cf globalOrientation.
