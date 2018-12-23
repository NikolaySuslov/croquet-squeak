actions
gotoWindow: event

	| front distance trans dy aspect atar |
	atar := event avatar ifNil:[^self].
	(self hasAncestor: atar) ifTrue:[^ self]. "don't go there"
	(self root = atar root) ifFalse:[^self]. "don't go there either"
	dy := self extent y.
	dy := dy/2.0.
	distance := dy/((atar viewAngle degreesToRadians/2.0) tan).
	aspect := self extent x/self extent y.
	aspect > atar viewAspect
 		ifTrue:[ distance := aspect*distance/atar viewAspect.].
	distance := distance + windowFrame radius.
	front := Vector3 x: 0 y: 0 z: distance.
	front := self orientation localPointToGlobal: front.
	front := self translation + front.
	trans := self localTransform copy.
	trans translation: front.
	atar goto: trans count: 6. 