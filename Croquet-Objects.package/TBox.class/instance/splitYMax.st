accessing
splitYMax

	| corner |
	corner := self min copy.
	corner y: self centerY - Epsilon.
	^ TBox min: corner max: self max copy.