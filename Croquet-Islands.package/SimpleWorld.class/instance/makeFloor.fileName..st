initialize
makeFloor: space fileName: txtrName

	| floor txtr |

	txtr := TTexture new initializeWithFileName: txtrName
				mipmap: true
				shrinkFit: false.
	txtr uvScale: 8.0@8.0.

	floor := TCube new.
	floor extentX:80 y:0.5 z: 80.
	floor translationX: 0 y: -6.0 z: 0.0.
	floor texture: txtr.
	floor objectName: 'floor' copy.
	space addChild: floor.

