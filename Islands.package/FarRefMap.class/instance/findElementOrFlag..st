private
findElementOrFlag: anObject
	"Answer the index of a first slot containing either a nil (indicating an empty slot) or an element that matches the given object. Answer the index of that slot or zero. Fail if neither a match nor an empty slot is found."

	| index |
	[(index := self scanFor: anObject) = 0] whileTrue:[
		self grow.
	].
	^index