utilities
shallowCopy: obj
	"Create a shallow copy of the argument on this island."
	| class copy value |
	obj isFarRef ifFalse:[^obj shallowCopy].
	class := obj send: #class to: obj.
	copy := self new: class.
	1 to: class instSize do:[:i|
		value := obj send: #instVarAt: withArguments: (Array with: i).
		copy instVarAt: i put: value.
	].
	^copy