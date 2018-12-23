drawing
drawOn: aCanvas
	"Put the painting on the display"

	color isTransparent ifFalse: [
		aCanvas fillRectangle: bounds color: color
	].
	paintingForm ifNotNil: [
		aCanvas paintImage: paintingForm at: bounds origin].

 