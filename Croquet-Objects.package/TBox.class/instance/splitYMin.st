accessing
splitYMin

	| corner |
	corner := self max copy.
	corner y: self centerY + Epsilon.
	^ TBox min: self min copy max: corner.