accessing
splitZMax

	| corner |
	corner := self min copy.
	corner z: self centerZ - Epsilon.
	^ TBox min: corner max: self max copy.