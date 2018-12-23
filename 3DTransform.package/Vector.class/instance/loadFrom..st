initialize
loadFrom: srcObject
	self == srcObject ifTrue:[^self].
	self class == srcObject class
		ifTrue:[self replaceFrom: 1 to: self size with: srcObject startingAt: 1]
		ifFalse:[self privateLoadFrom: srcObject]