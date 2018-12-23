accessing
flushHosts
	"TMorphicForm flushHosts"
	MorphHosts := nil.
	PasteUpMorph allInstancesDo:[:world|
		world isWorldMorph ifTrue:[
			(world canvas isKindOf: TWorldCanvas) ifTrue:[
				world canvas: nil.
			].
			(world firstHand isKindOf: THandMorph) ifTrue:[
				world removeHand: world firstHand.
				world addHand: HandMorph new.
			].
		].
	].