toys
makeLight: sp
	| light tframe |
	light := TLight new.
	tframe := TSpinner new.
	tframe translationX: -10 y:0.0 z: 0.0.
	tframe rotationAroundZ: 120.
	"This is to avoid some odd lighting effects"
	tframe rotateBy: 1 around: 1@0@0.
	tframe matNil.
	tframe contents: light.
	sp addChild: tframe.