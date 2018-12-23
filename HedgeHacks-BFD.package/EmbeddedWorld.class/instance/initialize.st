initialize
initialize
	| space win sky app |
	Processor activeIsland id: self class islandID.
	space := TSpace new.
	space registerGlobal: #mainEntry.
	self makeLight: space.
	self makeFloor: space fileName:'lawn.BMP'.
	sky := TSkyBox new initializeWithFileName: 'JUL'.
	sky step. "get going"
	space addChild: sky.
"
	app := TEmbeddedApp name: #TSlideShowApp extent: 400@300 data: 'icons'.
"
	app := TEmbeddedApp name: #TSlideShowApp extent: 400@300 data: 'icons'.
	win := self makeWindow.
	win contents: app.
	win translation: (0@0.25@-6).
	space addChild: win.

	^ space.

