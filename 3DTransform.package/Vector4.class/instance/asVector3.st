converting
asVector3
	| wValue |
	wValue := self w.
	wValue = 0.0 ifTrue:[^Vector3 zero].
	^Vector3 x: self x / wValue y: self y / wValue z: self z / wValue