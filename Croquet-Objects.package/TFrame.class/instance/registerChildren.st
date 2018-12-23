Islands
registerChildren
	"Register my children and give them a unique object name"
	| names newName pair |
	frameChildren ifNil:[^nil].
	names := Set new: frameChildren size.
	frameChildren do:[:each| 
		newName := each objectName.
		(names includes: newName) ifTrue:[
			[pair := newName stemAndNumericSuffix.
			newName := pair first, (pair last+1 max: 2) printString.
			names includes: newName] whileTrue.
			each objectName: newName.
		].
		names add: newName.
		each register
	].