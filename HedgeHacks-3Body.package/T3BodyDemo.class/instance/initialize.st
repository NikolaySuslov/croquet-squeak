initialize
initialize

	| txtr mat |
	super initialize.
	earth := TSphere new.
	earth radius: 20.0.
	earth segments: 40.
	txtr := TTexture new initializeWithFileName: 'earth.png'.
	mat := TMaterial new.
	mat texture: txtr.
	mat ambientColor: #(1 1 1 1)asFloatArray.
	mat diffuseColor: #(1 1 1 1)asFloatArray.
	mat specularColor: #(0.1 0.1 0.1 1)asFloatArray.
	mat shininess: 0.1.
	earth material: mat.
	earthFrame := TGroup new.
	earthFrame translation:(30@10@-120).
	earth translation:(30@10@-120).
	self addChild:earth.
	self addChild: earthFrame.

	earthGravity := T3BodyAttractor new.
	earthGravity radius: earth radius+2.
	earthGravity mass: 700000.0.
	earth addChild: earthGravity.
	
	earthRot := 0.
	tilt := Matrix4x4 identity rotationAroundZ: 23.45.
	earthRot := 0.0.

	moon := TSphere new.
	moon radius: (earth radius *0.27).
	moon segments: 30.
	txtr := TTexture new initializeWithFileName: 'moon.png'.
	mat := TMaterial new.
	mat texture: txtr.
	mat ambientColor: #(1 1 1 1)asFloatArray.
	mat diffuseColor: #(1 1 1 1)asFloatArray.
	mat specularColor: #(0.1 0.1 0.1 1)asFloatArray.
	mat shininess: 0.1.
	moon material:mat.
	moon translation: (70@0@100).
	self addChild: moon.
	moonGravity := T3BodyAttractor new.
	moonGravity radius: moon radius.
	moonGravity mass: 100000.0.
	moon addChild: moonGravity.
	stepRemainder := 0.
	
	thirdBody := T3BodyBody new.
	self addChild: thirdBody.
	thirdBody addAttractor: earthGravity.
	thirdBody addAttractor: moonGravity.
	thirdBody translation: 30@20@40.
	speed := 1.0.
	self reset.
	thirdBody stop.

	self step. "get going"