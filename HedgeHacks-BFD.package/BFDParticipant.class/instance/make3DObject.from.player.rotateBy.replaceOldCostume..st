3d sketch
make3DObject: style from: aForm player: aPlayer rotateBy: rot replaceOldCostume: aBoolean
	| bbForm tex mat scale space island tform tfm mesh pos frame t3dMesh |
	style == #billboard ifTrue:[^self popUpBillboard: aForm player: aPlayer].
	space := harness activeSpace.
	island := harness activeIsland.

	"Convert the form"
	bbForm := Form extent: aForm extent asSmallerPowerOfTwo depth: 32.
	aForm displayScaledOn: bbForm in: (bbForm boundingBox insetBy: 1).
	"Smear the borders of the texture a bit to prevent problems in texture mapping"
	bbForm smearFill: 10. "pixels - less is faster but more is safer"

	"Create the texture"
	tform := island future new: TForm.
	tform future initialize: nil form: aForm mipmap: true 
		shrinkFit: true extension: #colorKeyZero.
	tex := island future new: TTexture.
	tex future initializeWithTForm: tform.

	"The material"
	mat := island future new: TMaterial.
	mat future ambientColor: #(0.8 0.8 0.8 1) asFloatArray.
	mat future diffuseColor: #(0.8 0.8 0.8 1) asFloatArray.

	mat future texture: tex.
	mat future textureMode: GLModulate.

	"The t3d mesh"
	t3dMesh := T3DSubdivision make3DMeshFrom: aForm style: style.
	scale := 0.01.

	tfm := (Quaternion axis: 1@0@0 angle: 180) asMatrix4x4.
	tfm := tfm composeWith: (Quaternion axis: 0@1@0 angle: rot) asMatrix4x4.
	tfm := tfm composeWith: (Matrix4x4 withScale: scale@scale@scale).
	tfm := tfm composeWith: (Matrix4x4 withOffset: (aForm width * -0.5) @ (aForm height * -0.5) @ 0).
	t3dMesh transformBy: tfm.

	"The TMesh"

	mesh := island future new: TMesh.
	mesh future
		initializeWithVertices: t3dMesh vertices 
		alias: nil 
		norms: t3dMesh vertexNormals
		textureUV: t3dMesh texCoords
		faceGroups: {1. t3dMesh zeroBasedFaceGroup}
		material: mat.
	mesh future solid: false.
	mesh future initBounds.

	frame := island future new: TDragger.
	frame future contents: mesh.

	"Position it"
	pos := harness avatar translation - (harness avatar lookAt * 10).
	frame future translation: pos.
	frame future rotationAroundY: harness avatar yaw + rot.
	space future addChild: frame.
