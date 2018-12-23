accessing
pid
	^ pid ifNil: [Processor activeProcess hash]
		
