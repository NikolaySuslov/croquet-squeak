accessing
splitXMax

	| corner |
	corner := self min copy.
	corner x: self centerX - Epsilon.
	^ TBox min: corner max: self max copy.