as yet unclassified
testCreation

	| reg |
	reg := TFarRefRegistry new.
	self assert: (reg isKindOf: TFarRefRegistry).
	self assert: (reg asArray isEmpty).
