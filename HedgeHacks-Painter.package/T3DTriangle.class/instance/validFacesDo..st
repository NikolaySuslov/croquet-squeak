enumeration
validFacesDo: aBlock
	| tmp |
	tmp := self.
	[tmp == nil] whileFalse:[
		tmp isValid ifTrue:[aBlock value: tmp].
		tmp := tmp next].