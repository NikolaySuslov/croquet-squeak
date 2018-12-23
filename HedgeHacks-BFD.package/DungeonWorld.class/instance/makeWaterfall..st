initialize
makeWaterfall: trans

	| ptxtr aMat tframe |
	ptxtr := TTexture new initializeWithFileName: 'Water1.BMP' mipmap: false shrinkFit: false extension: #colorKey.
	ptxtr aspectFixed: false.
	ptxtr extent: 3@12.
	aMat := TMaterial new.
	aMat ambientColor: #(1.0 1.0 1.0 0.4).
	aMat diffuseColor: #(1.0 1.0 1.0 0.4).
	ptxtr material: aMat.
	tframe := TParticleTxtr new initializeWithSize: 100.
	tframe translation: trans - (1@5@0). "take the size of the texture into account".
	tframe addTexture: ptxtr.
	tframe setLifetimeRange: (1700 to: 2500).
	tframe setPositionRangeMin:(-0.8@-0.1@-0.1) max: (0.8@0.1@0.1).
	tframe setVelocityRangeMin:(-1.2@-0.1@-1.2) max:(1.2@0.1@4.2).
	tframe setAccelerationRangeMin:(0@-25@0) max:(0@-20@0).
	tframe rotationAroundY: -90.
	tframe startColor: #(1.0 1.0 1.0 0.7).
	tframe endColor: #(1.0 1.0 1.0 0.2).
	^ tframe.
