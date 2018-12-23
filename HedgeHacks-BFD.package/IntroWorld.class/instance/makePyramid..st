initialize
makePyramid: sp
	| pyr matNorm spinner |
	pyr := TSierpinski new.
	matNorm := TMaterial new.
	matNorm ambientColor: #(0.5 0.7 0.7 0.5).
	matNorm diffuseColor: #(0.5 0.7 0.7 0.5).
	pyr material: matNorm.
	pyr scale: 5.0.
	pyr depth: 3.

	spinner := TSpinner new.
	spinner translationX: 12 y:0 z: 12.
	spinner contents: pyr.
	sp addChild: spinner.
