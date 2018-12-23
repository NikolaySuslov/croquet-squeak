initialize
makeChess: sp
	| win morphic |
	morphic := TEmbeddedApp name: #TMorphicWorld extent: 512@512 
		data: {#makeMorph:. BouncingAtomsMorph}.

	win := self makeWindow.
	win translationX: 12 y: 0.0 z: -16.0.
	win rotationAroundY: -75.
	win contents: morphic.
	win closeContents.
	sp addChild: win.