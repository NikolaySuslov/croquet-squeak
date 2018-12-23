accessing
splitXMin

	| corner |
	corner := self max copy.
	corner x: self centerX + Epsilon.
	^ TBox min: self min copy max: corner.