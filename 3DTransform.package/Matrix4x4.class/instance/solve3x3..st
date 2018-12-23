solving
solve3x3: aVector
	"Solve a 3x3 system of linear equations. Assume that all the a[4,x] and a[x,4] are zero.
	NOTE: This is a hack, but it's the fastest way for now."
	| m |
	m := self shallowCopy.
	m a44: 1. "need this for inversion"
	m := m inplaceHouseHolderInvert.
	m ifNil:[^nil].
	^m localDirToGlobal: aVector.