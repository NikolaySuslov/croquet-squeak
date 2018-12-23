initialize
makeFlash: sp
	| win morphic |
	morphic := TEmbeddedApp name: #TMorphicWorld extent: 512@256 
		data: {#makeFlash:. 'Content/Movies/actinMyosin2.swf'}.

	win := self makeWindow.
	win translationX: 31 y: 0.0 z: 28.0.
	win rotationAroundY: -90.
	win contents: morphic.
	win closeContents.
	sp addChild: win.
