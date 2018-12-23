initialize
initialize

	cube := TCube new.
	cube extent:2@2@2.
	super initialize.
	cube material color: #(0.4 0.5 0.7 0.25)asVectorColor.
	cube material specularColor: #(0.9 0.9 0.9 1.0)asVectorColor.
	cube checkAlpha.
	viewPoint := TGroupNoClip new.
	self addChild: viewPoint.