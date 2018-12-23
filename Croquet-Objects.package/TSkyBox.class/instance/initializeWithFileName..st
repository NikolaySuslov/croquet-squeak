initialize
initializeWithFileName: fname

	|  txtr mat scale shrink sc dy |
	sc := 10.
	scale :=128 * sc.
	dy := 0.
	shrink := 8 * sc.
	mat := TMaterial new.
	mat fullBright: true.
	mat ambientColor: #(1.0 1.0 1.0 1.0).
	mat diffuseColor: #(1.0 1.0 1.0 1.0).
	mat emissiveColor: #(1.0 1.0 1.0 1.0).

	txtr := TTexture
				new initializeWithFileName: 'SkyBox', fname, 'BK.bmp'
				mipmap: false
				shrinkFit: false.
	txtr extent: scale@scale.
	txtr translationX: 0.0 y:dy z: (scale-shrink) negated/2.0.
	txtr material: mat.
	self addChild: txtr.

	txtr := TTexture
				new initializeWithFileName: 'SkyBox', fname, 'LF.bmp'
				mipmap: false
				shrinkFit: false.
	txtr extent: scale@scale.
	txtr rotationAroundY: 90.
	txtr translationX: (scale-shrink)/2.0 negated y:dy z: 0.0.
	txtr material: mat.
	self addChild: txtr.

	txtr := TTexture
				new initializeWithFileName: 'SkyBox', fname, 'RT.bmp'
				mipmap: false
				shrinkFit: false.
	txtr extent: scale@scale.
	txtr rotationAroundY: -90.
	txtr translationX: (scale-shrink)/2.0 y:dy z: 0.0.
	txtr material: mat.
	self addChild: txtr.

	txtr := TTexture
				new initializeWithFileName: 'SkyBox', fname, 'FR.bmp'
				mipmap: false
				shrinkFit: false.
	txtr extent: scale@scale.
	txtr rotationAroundY: 180.
	txtr translationX: 0.0 y:dy z: (scale-shrink)/2.
	txtr material: mat.
	self addChild: txtr.


	txtr := TTexture
				new initializeWithFileName: 'SkyBox', fname, 'UP.bmp'
				mipmap: false
				shrinkFit: false.
	txtr extent: scale@scale.
	txtr rotationAroundX: 90.
	txtr translationX: 0.0 y: ((scale-shrink)/2) + (dy)z: 0.0.
	txtr material: mat.
	self addChild: txtr.
	self solidTree: false.
	dalpha := 0.02.
