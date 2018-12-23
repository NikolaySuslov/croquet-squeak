public
all
	self slots.
	item class class allInstVarNames isEmpty ifFalse: [ self classInstance ].
	item class classPool isEmpty ifFalse: [ self classVars ].
	item class sharedPools isEmpty ifFalse: [	self sharedPools ].
	

