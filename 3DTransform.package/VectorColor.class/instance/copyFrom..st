converting
copyFrom: array

	| sz |
	sz := self size min: array size.
	1 to: sz do:[:index | self at:index put: (array at: index)].
	array size = 3 ifTrue:[self at:4 put:1.0].