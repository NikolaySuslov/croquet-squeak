initialize
makeProjectLink: sp
	| win morphic |
	morphic := TEmbeddedApp name: #TMorphicWorld extent: 1024@768 
		data: {#makeProjectLink:. 'Squeak Intro for Croquet'}.

	win := self makeWindow.
	win translationX: 8 y: 0.0 z: -20.0.
	win contents: morphic.
	win closeContents.
	sp addChild: win.
	^ win.
