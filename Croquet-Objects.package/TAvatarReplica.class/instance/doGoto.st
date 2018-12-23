driving
doGoto
	"Move the camera to a specific pose (location and orientation) in the TSpace, via an interpolated rotation/translation. "
	| qFrom qTo fromLoc toLoc trans |
	gotoCount := gotoCount - 1.
	gotoCount <= 0 ifTrue:[
lastPosition := localTransform translation.
		self localTransform: gotoTransform.
		self yawTransform.
		^self].
	"Interpolate"
	qFrom := localTransform asQuaternion.
	qTo := gotoTransform asQuaternion.
	fromLoc := localTransform translation.
	toLoc := gotoTransform translation.
	fromLoc ~= toLoc ifTrue:[
		fromLoc := fromLoc  + ((toLoc - fromLoc)/gotoCount).].
	qFrom := qFrom slerpTo: qTo at: (1.0/gotoCount).
	trans := qFrom asMatrix4x4.
	trans translation: fromLoc.
	self localTransform: trans.
	self pitch: self pitch.
	(self future: 50) doGoto.