initialize
initializeWithProject: aProject thumb: aTForm extent: worldExtent
	eventQueue := SharedQueue new.
	thumb := aTForm.
	sha := thumb send:[:tf| tf sha].

	self runScript: #onEvent2D:
		when: {thumb. #morphicEvent2D}.


	tform := TForm new 
		initialize: nil sha: sha 
		form: ((Form extent: worldExtent depth: 32) fillColor: Color red)
		mipmap: true shrinkFit: false extension: nil. 
	TFormManager default substituteForm: tform.
	form := tform textureForm.

	world := aProject world.
	world viewBox: (0@0 extent: worldExtent).
	world canvas: (TWorldCanvas on: self).
	world hands do:[:h| world removeHand: h].
	world addHand: THandMorph new.

	"This is VERY useful for debugging events"
	false ifTrue:[world makeNewDrawing: nil at: world bounds center].
	hands := WeakKeyDictionary new.
	updating := false.

	^self