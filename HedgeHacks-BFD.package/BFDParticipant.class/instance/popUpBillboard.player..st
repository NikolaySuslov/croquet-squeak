3d sketch
popUpBillboard: aForm player: aPlayer
	| space bbForm size billboard aPosition texture mat frame island tform camera |

	space := harness activeSpace.
	island := harness activeIsland.

	size := aForm extent * 0.01.
	bbForm := Form extent: aForm extent asSmallerPowerOfTwo depth: 32.
	aForm displayScaledOn: bbForm in: (bbForm boundingBox insetBy: 1).

	tform := island future new: TForm.
	tform future initialize: nil form: aForm mipmap: true 
		shrinkFit: true extension: #colorKeyZero.
	texture := island future new: TTexture.
	texture future initializeWithTForm: tform.
	billboard := island future new: TBillboard.
	texture future aspect: size y / size x asFloat. 
	texture future extent: size * 3.

	mat := island future new: TMaterial.
	mat future ambientColor: #(1 1 1 0.99).
	mat future diffuseColor: #(1 1 1 0.99).
	mat future emissiveColor: #(1 1 1 0.99).

	texture future material: mat.

	billboard future addChild: texture.

	"frame := island future new: TDragger.
	frame future contents: billboard."
	frame := billboard.

	camera := harness camera.
	aPosition := camera "avatar" translation - (camera "avatar" lookAt * 10).
	frame future translation: aPosition.
	space future addChild: frame.
