transforming
composedWithGlobal: aMatrix4x4
	| result |
	result := self class new.
	self privateTransformMatrix: aMatrix4x4 with: self into: result.
	^result