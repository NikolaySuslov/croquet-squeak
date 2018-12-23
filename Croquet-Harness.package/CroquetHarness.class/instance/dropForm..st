event handling
dropForm: aForm
	"Drop aForm in front of the camera"
	| space island txtr tform aPosition size mat wnd |
	size := aForm extent * 0.01.
	"Grab both space and island"
	space := self activeSpace.
	island := self activeIsland.
	tform := island future new: TForm.
	tform future initialize: nil form: aForm mipmap: true shrinkFit: true extension: nil.
	txtr := island future new: TTexture.
	txtr future initializeWithTForm: tform.
	txtr future aspect: size y / size x asFloat. 
	txtr future extent: size.

	mat := island future new: TMaterial.
	mat future ambientColor: #(1 1 1 0.99) asFloatArray.
	mat future diffuseColor: #(1 1 1 0.99) asFloatArray.
	mat future emissiveColor: #(1 1 1 0.99) asFloatArray.

	txtr future material: mat.

	aPosition := avatar translation - (avatar lookAt * 10).
	wnd := self makeWindow.
	wnd future contents: txtr.
	wnd future translation: aPosition.
	wnd future rotationAroundY: avatar yaw.
	space future addChild: wnd.
