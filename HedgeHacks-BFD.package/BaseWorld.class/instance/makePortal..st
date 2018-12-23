toys
makePortal: textureName
	| p1 win pic |
	p1 := TPortal new.
	win := self makeWindow.
	win contents: p1.
	textureName ifNotNil:[
		pic := TTexture
					new initializeWithFileName: textureName
					mipmap: true
					shrinkFit: false.
		win rectFront: pic.
	].
	win closeContents.
	win showOpenButton.
	^win