initialize
makePyramid: sp
	| pyr matNorm spinner |
	pyr := TSierpinski new.
	matNorm := TMaterial new.
	matNorm ambientColor: #(0.9 0.6 0.5 0.5).
	matNorm diffuseColor: #(0.9 0.6 0.5 0.5).
	pyr material: matNorm.
	pyr scale: 5.0.
	pyr depth: 3.

	spinner := TSpinner new.
	spinner translationX: -10 y:0 z: -10.
	spinner contents: pyr.
	sp addChild: spinner.
