accessing connection
allPromisesEmpty

	^ connection
		ifNotNilDo: [ :conn | conn allPromisesEmpty]
		ifNil: [true]