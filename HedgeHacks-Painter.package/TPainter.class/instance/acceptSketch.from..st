actions
acceptSketch: aForm from: sketchEditor
	| rot style |

	style := #round. "#billboard #flat"
	rot := 0.
	leftButton label = 'Left' ifTrue:[rot := 0].
	leftButton label = 'Forward' ifTrue:[rot := 90].
	leftButton label = 'Right' ifTrue:[rot := 180].
	leftButton label = 'Back' ifTrue:[rot := 270].

	window owner 
		make3DObject: style
		from: aForm 
		player: repaintedPlayer
		rotateBy: rot
		replaceOldCostume: replaceOldCostume.

	self close.