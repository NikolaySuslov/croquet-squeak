initialize
initialize
	| space light morphic win pc portal |
	Processor activeIsland id: self class islandID.
	space := TSpace new.
	space registerGlobal: #mainEntry.
	space color:(VectorColor r: 0.8 g: 0.8 b: 1.0 a: 1.0).
	light := TLight new.
	space addChild: light.
	light rotationAroundZ:125.

	morphic := self makeSpreadsheet: 1024@768.

	win := self makeWindow.
	win contents3D: morphic.
	win translation: (0@0.25@2).
	win matRectDown: win matRectNormal.
	win matRectOver: win matRectNormal.
	space addChild: win.

	self makeFloor: space fileName: 'graph128.bmp'.

	win := self makePortal: nil.
	win rotationAroundY: 180.
	win translationX: 0 y: 0.0 z: 40.0.
	win openContents.
	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: IntroWorld islandID
				name: 'Intro World'
				viewpointName: #SpreadSheetPortal.

	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #IntroPortal.
	space addChild: win.
	^ space.

