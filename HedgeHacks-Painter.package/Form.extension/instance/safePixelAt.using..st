*HedgeHacks-Painter
safePixelAt: aPoint using: bitPeeker
	"Answer the color of the receiver at aPoint but test for being inside first and answer Color transparent if not"
	(aPoint x < 0 or:[aPoint y < 0]) ifTrue:[^0].
	(aPoint x >= width or:[aPoint y >= height]) ifTrue:[^0].
	^bitPeeker pixelAt: aPoint