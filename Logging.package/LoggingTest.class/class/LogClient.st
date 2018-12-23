regression-tests
LogClient

	^ Smalltalk at: #LogClient ifAbsent: [ self error: 'LogEngine not loaded' ]