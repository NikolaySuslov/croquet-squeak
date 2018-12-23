transforming
*= m2
	"Perform a 4x4 matrix multiplication with result into self."
	| result |
	result := self * m2.
	self replaceFrom: 1 to: 16 with: result startingAt: 1.
