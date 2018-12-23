as yet unclassified
makeSomeFish: sp target: fishTarget
	| pic1 pic2 pic3 rnd fish frame |
	pic1 := TTexture new initializeWithFileName: (FileDirectory pathFromURI: 'Content/Underwater/OpalEye.jpg') mipmap: true shrinkFit: false.
	pic2 := TTexture new initializeWithFileName: (FileDirectory pathFromURI: 'Content/Underwater/RockFish.jpg') mipmap: true shrinkFit: false.
	pic3 := TTexture new initializeWithFileName: (FileDirectory pathFromURI: 'Content/Underwater/Seniorita.jpg') mipmap: true shrinkFit: false.
	rnd := Random seed: 123456.
	{pic1. pic2. pic3} do:[:tex|
		1 to: 4 do:[:i|
			fish  := self loadNewFish.
			fish scale: 3.
			fish solid: false.
			fish objectName: 'fish'.
			fish material texture: tex.
			fish material textureMode: GLModulate.
			frame := TDemoFish new.
			frame normalMaterial: fish material.
			frame target: fishTarget.
			frame translationX: rnd next * 20 - 10 y: rnd next z: rnd next * 20 - 10.
			frame contents: fish.
			sp addChild: frame.
		].
	].

	fish  := self loadNewFish.
	fish solid: false.
	fish scale: 3.
	fish objectName: 'fish'.
	fish material texture: pic1.
	fish material textureMode: GLModulate.
	^fish