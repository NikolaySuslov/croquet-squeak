accessing
bitXor: mask
	"XOR the receiver and mask"
	| result |
	result := self class nilObjectID.
	1 to: self size do:[:i|
		result at: i put: ((self at: i) bitXor: (mask at: i)).
	].
	^result