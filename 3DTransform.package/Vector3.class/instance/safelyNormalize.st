vector functions
safelyNormalize
	"Safely normalize the receiver, e.g. check if the length is non-zero"
	| length |
	length := self length.
	length = 1.0 ifTrue:[^self].
	length = 0.0 ifFalse:[self /= length].