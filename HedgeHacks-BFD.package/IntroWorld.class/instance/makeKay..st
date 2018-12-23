initialize
makeKay: sp
	| env pic win tframe |
	pic := TTexture
				new initializeWithFileName: 'KAY.bmp'
				mipmap: true
				shrinkFit: false.

	env := TTexture
				new initializeWithFileName: 'SkyBoxJULRT.bmp' 
				mipmap: true
				shrinkFit: false.

	tframe := TWaves initializeWithSize: 20@20.
	tframe texture: pic.
	tframe envTexture: env.

	win := self makeWindow.
	win contents: tframe.
	win translationX: 7 y: 0.0 z: -2.0.
	sp addChild: win.

