geometry
position: aPoint
	| delta |
	texture ifNil:[^super position: aPoint].
	delta := aPoint - bounds topLeft.
	(delta x = 0 and: [delta y = 0]) ifTrue: [^ self].  "Null change"
	self privateFullMoveBy: delta.
	owner ifNotNil:[owner layoutChanged].
