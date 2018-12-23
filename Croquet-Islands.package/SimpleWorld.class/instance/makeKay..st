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
	tframe divisions:3@3.
	win := TWindow new.
	win contents: tframe.
	win translationX: 7 y: 0.0 z: -10.0.
	sp addChild: win.

