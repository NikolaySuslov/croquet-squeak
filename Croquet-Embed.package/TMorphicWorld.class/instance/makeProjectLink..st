initialize
makeProjectLink: projName
	| project |
	project := Project named: projName.
	world := project world.
	world borderWidth: 0.
	world color: Color white.
	world beWorldForProject: nil.
	world viewBox: world bounds.
	world canvas: (TWorldCanvas on: self).
	world hands do:[:h| world removeHand: h].
	world addHand: THandMorph new.

	"This is VERY useful for debugging events"
	false ifTrue:[world makeNewDrawing: nil at: world bounds center].
	hands := WeakKeyDictionary new.
	updating := false.
