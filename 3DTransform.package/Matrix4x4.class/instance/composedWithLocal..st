transforming
composedWithLocal: aMatrix4x4
	| result |
	result := self class new.
	self privateTransformMatrix: self with: aMatrix4x4 into: result.
	^result