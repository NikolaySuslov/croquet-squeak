accessing
flip: bool
	flip == bool ifTrue: [^ self].
	(flip := bool)
		ifFalse: [norm := Vector3 x: 0.0 y: 0.0 z: 1.0]
		ifTrue: [norm := Vector3 x: 0.0 y: 0.0 z: -1.0].
	changed := true.