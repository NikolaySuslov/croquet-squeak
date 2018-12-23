enumeration
do: aBlock
	| tmp |
	tmp := self.
	[tmp == nil] whileFalse:[
		aBlock value: tmp.
		tmp := tmp next].