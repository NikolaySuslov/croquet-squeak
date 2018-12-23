transforming
* m2
	"Perform a 4x4 matrix multiplication."
	| result |
	result := self class new.
	self privateTransformMatrix: self with: m2 into: result.
	^result