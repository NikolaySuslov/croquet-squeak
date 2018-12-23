accessing
extent: ext

	| dx dy ddx ddy topCorner box across |

	frameChildren ifNil:[^super extent: ext].
	dx := ext x/buttonWidth. 
	dx < 1 ifTrue: [ dx := 1.].
	dy := frameChildren size / dx.
	(dx*dy) < frameChildren size ifTrue:[dy := dy + buttonWidth.].
	extent := (dx asFloat * buttonWidth)@(dy asFloat*buttonWidth).
	topCorner := (extent x/-2.0 + (buttonWidth/2.0))@(extent y/2.0 - (buttonWidth/2.0)).
	across := (dx+0.5) asInteger.
	frameChildren doWithIndex:[ :fc :index |
		ddx := (index-1\\across)*buttonWidth.
		ddy := (index-1//across)*buttonWidth negated.
		box := fc boundingBox.
		fc translationX: topCorner x + ddx-box center x y: topCorner y + ddy-box center y z:0.0.
		].
