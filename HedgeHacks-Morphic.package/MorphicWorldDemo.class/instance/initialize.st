initialize
initialize
	| space light morphic |
	space := TSpace new.
	space registerGlobal:#masterSpace.
	light := TLight new.
	space addChild: light.
	light rotationAroundZ:125.

	morphic := self makeMorphic: (MessageSend
			receiver: MorphicWorldHost
			selector: #makeMorph:extent:from:
			arguments: {BouncingAtomsMorph})
			extent: 1024@768.
	morphic translation: 0@0@-10.
	space addChild: morphic.

	self makeFloor: space fileName:'lawn.bmp'.
	^ space.

