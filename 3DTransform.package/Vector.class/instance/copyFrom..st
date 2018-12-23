as yet unclassified
copyFrom: array

	| sz |
	sz := self size min: array size.
	1 to: sz do:[:index | self at:index put: (array at: index)].