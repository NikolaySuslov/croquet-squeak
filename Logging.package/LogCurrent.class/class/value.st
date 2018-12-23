as yet unclassified
value
 
	"Answer the current value for this variable in the current context."
	
	"if a fork has occured the returned value will be from the previous process, we copy it 
	and make the duplicate our own"
	
	| log |
	
	^ Processor activeProcess in: [ :p | 
		
		log := p environmentAt: self key ifAbsent: [ self default ].
		log pid = p hash ifFalse: [
			log := log copy.
			log setPid: p hash.
			self value: log].
		
		log

 	]