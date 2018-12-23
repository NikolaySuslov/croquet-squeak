initialize
makeGalleryPortal: sp
	| mat p1 win pic |
	mat := TMaterial new.
	p1 := TPortal new.
	p1 material: mat.

	win := self makeWindow.
	win rotationAroundY: 180.
	win translationX: -20 y: 0.0 z: 30.0.
	win contents: p1.
	pic := TTexture
				new initializeWithFileName: 'GrnChplTwr.bmp'
				mipmap: true
				shrinkFit: false.
	win rectFront: pic.
	win openContents.
	sp addChild: win.