as yet unclassified
default: router
  
	default ifNotNil: [
		
		(router isNil or: [router isKindOf: self]) ifFalse: [ ^ self error: 'use nil for default, or must use an instance of LogCurrent (or subclasses)'. ].
				
		default processesWithMyAdapterDo: [ :proc | 
		
			proc environmentAt: self put: router.
	
		].
	].

	default := router