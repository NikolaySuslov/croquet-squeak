accessing
scaleTexture: oldForm to: scaledSize
	| mmForm |
	oldForm extent = scaledSize ifTrue:[^oldForm].
	mmForm := Form extent: scaledSize depth: 32.
	(WarpBlt current toForm: mmForm)
		sourceForm: form destRect: mmForm boundingBox;
		combinationRule: 3;
		cellSize: 2;
		warpBits.
	^mmForm