as yet unclassified
addToSuiteFromSelectors: suite
	#(	CroquetVMTests CroquetSystemTests 
		IslandTests TSessionTests TMessageRouterTests
	) do:[:clsName|
		Smalltalk at: clsName ifPresent:[:tstClass|
			(tstClass withAllSubclasses asArray sort:[:c1 :c2| c1 name <= c2 name]) do: [:each | 
				each isAbstract ifFalse: [each addToSuiteFromSelectors: suite].
			].
		].
	].
