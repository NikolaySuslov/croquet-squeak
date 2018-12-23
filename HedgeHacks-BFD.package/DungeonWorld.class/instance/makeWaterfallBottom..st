initialize
makeWaterfallBottom: trans

	| ptxtr aMat tframe |
	ptxtr := TTexture new initializeWithFileName: 'Water1.BMP' mipmap: false shrinkFit: false extension: #colorKey.
	ptxtr aspectFixed: false.
	ptxtr extent: 5@5.
	aMat := TMaterial new.
	aMat ambientColor: #(1.0 1.0 1.0 0.2).
	aMat diffuseColor: #(1.0 1.0 1.0 0.2).
	ptxtr material: aMat.
	tframe := TParticleTxtr new initializeWithSize: 100.
	tframe translation: trans + (-3@2.5@0). "take the size of the texture into account".
	tframe addTexture: ptxtr.
	tframe setLifetimeRange: (1500 to: 2000).
	tframe setPositionRangeMin:(-5.0@-0.1@-5.0) max: (5.0@0.1@5.0).
	tframe setVelocityRangeMin:(-1.2@2.0@-1.2) max:(1.2@4.0@4.2).
	tframe setAccelerationRangeMin:(0@-1@0) max:(0@-0.5@0).
	tframe rotationAroundY: -90.
	tframe startColor: #(1.0 1.0 1.0 0.6).
	tframe endColor: #(1.0 1.0 1.0 0.0).
	^ tframe.
