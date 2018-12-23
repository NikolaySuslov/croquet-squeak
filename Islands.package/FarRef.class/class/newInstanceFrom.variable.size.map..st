recompiling
newInstanceFrom: oldInstance variable: variable size: instSize map: map
	"Create a new instance of the receiver based on the given old instance.
	The supplied map contains a mapping of the old instVar names into
	the receiver's instVars"
	| new |
	variable
		ifTrue: [new := self basicNew: oldInstance basicSize]
		ifFalse: [new := self basicNew].
	1 to: instSize do: 
		[:offset |  (map at: offset) > 0 ifTrue:
			[new primitiveInstVarAt: offset
					put: (oldInstance primitiveInstVarAt: (map at: offset))]].
	variable 
		ifTrue: [1 to: oldInstance basicSize do: 
					[:offset |
					new primitiveBasicAt: offset put: (oldInstance primitiveBasicAt: offset)]].
	^new