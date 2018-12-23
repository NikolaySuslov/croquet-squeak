private
scaleTexture: form to: scaledSize
	| mmForm |
	form extent = scaledSize ifTrue:[^form].
	mmForm := Form extent: scaledSize depth: 32.
	(WarpBlt current toForm: mmForm)
		sourceForm: form destRect: mmForm boundingBox;
		combinationRule: 3;
		cellSize: 2;
		warpBits.
	^mmForm