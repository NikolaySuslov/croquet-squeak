initialize
initialize

	| space portal sky win p3 pic |

	space := TSpace new.
	space registerGlobal:#masterSpace.
	self makeLights: space.
	self makeFloor:space fileName:'lawn.bmp'.
	self makeKay: space.
	self makePyramid: space.

	win := TWindow new.
	win translation: 0@0@(-20).
	space addChild: win.

	portal := TPortal new.
	portal registerGlobal:#portal1.
	portal extent:5@5.
	win contents: portal.

	sky := TSkyBox new initializeWithFileName: 'JUL'.
	space addChild: sky.
	sky step. 
	"get going"

	p3 := TPortal3D new.
	p3 translation: 10@(-1)@10.
	space addChild: p3.
	p3 registerGlobal:#portal3D.

	TScrollBox3D new initializeWithContents: p3.

	pic := TRotTexture
				new initializeWithFileName: 'KAY.bmp'
				mipmap: true
				shrinkFit: false.
	pic translation:0@0@(-2).
	space addChild: pic.