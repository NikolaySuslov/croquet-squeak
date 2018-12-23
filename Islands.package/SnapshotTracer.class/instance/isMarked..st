searching
isMarked: child
	"Answer whether child has been marked already"
	child ifNil:[^true].
	child class == SmallInteger ifTrue:[^true].
	^parents includesKey: child