initialize
makeWorld: aMorph
	morph := aMorph.
	world := PasteUpMorph newBounds: (0@0 extent: extent).
	world borderWidth: 0.
	world color: Color white.
	world beWorldForProject: nil.
	world viewBox: world bounds.
	world canvas: (TWorldCanvas on: self).
	world hands do:[:h| world removeHand: h].
	world addHand: THandMorph new.
	aMorph ifNotNil:[world addMorphCentered: aMorph].

	"This is VERY useful for debugging events"
	false ifTrue:[world makeNewDrawing: nil at: world bounds center].
	hands := WeakKeyDictionary new.
	updating := false.
