toys
makeFloor: sp fileName: txtrName
	| stone txt mat |
	txt := TTexture
				new initializeWithFileName: txtrName
				mipmap: true
				shrinkFit: false.
	txt uvScale: 8.0@8.0.
	mat := TMaterial new.
	mat texture: txt.
	stone := TCube new.
	stone extentX:80 y:0.5 z: 80.
	stone translationX: 0 y: -6.0 z: 0.0.
"	stone texture: txt."
	stone material: mat.
	stone objectName: 'floor' copy.
	sp addChild: stone.
	^ stone.

