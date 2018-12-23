importing
importClass
	"Export class/version"
	| className classFormat classShape importedClass classVersionID |
	className := self importNext.
	classFormat := self importNext.
	classShape := self importNext.
	classVersionID := self importNext.
	(IslandReader isBlessedVersionID: classVersionID) ifFalse:[
		self flag: #fixMe. "Should we raise an exception here?"
		unblessed add: className.
	].
	importedClass := Smalltalk at: className ifAbsent:[nil].
	importedClass ifNil:[self error: className, ' does not exist'].

	"Verify class structure"
	importedClass format = classFormat 
		ifFalse:[self error: className, ' has changed class format'].
	importedClass allInstVarNames = classShape
		ifFalse:[self error: className, ' has changed class shape'].
	importedClass classVersionID = classVersionID
		ifFalse:[self error: className, ' has changed class version'].

	^importedClass