as yet unclassified
testAdding

	| reg |
	reg := TFarRefRegistry new.
	reg add: 'thingy'.
	reg add: 'bar'.
	reg inspect.
