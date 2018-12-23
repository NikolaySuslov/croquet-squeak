accessing
adapters

	adapter ifNil: [ adapter := LogAdaptersSet new ]. 

	(adapter isKindOf: LogAdaptersSet) ifTrue: [ ^ adapter ].
	
	^adapter := LogAdaptersSet with: adapter.
	
	