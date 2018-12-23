accessing
splitZMin

	| corner |
	corner := self max copy.
	corner z: self centerZ + Epsilon.
	^ TBox min: self min copy max: corner.