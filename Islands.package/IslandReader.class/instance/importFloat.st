importing
importFloat
	| float |
	float := Float new: 2.
	float basicAt: 1 put: dataStream nextUInt32.
	float basicAt: 2 put: dataStream nextUInt32.
	^float