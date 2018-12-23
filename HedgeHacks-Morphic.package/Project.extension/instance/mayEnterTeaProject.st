*HedgeHacks-Morphic
mayEnterTeaProject
	"Can we enter this project?"
	(world isKindOf: StringMorph) ifTrue: [
		self inform: 'This project is not all here'.
		^false].
	"Check the guards"
	guards ifNotNil:
		[guards := guards reject: [:obj | obj isNil].
		guards do: [:obj | obj okayToEnterProject ifFalse: [^ false]]].
	^true