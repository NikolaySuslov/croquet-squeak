searching
unmarkedObjects
	"All objects should be marked by now. If there are any unmarked ones, report them"
	| set obj |
	set := IdentitySet new.
	obj := self someObject.
	[obj == lastObject] whileFalse:[
		(self isMarked: obj) ifFalse:[set add: obj].
		obj := obj nextObject.
	].
	^set