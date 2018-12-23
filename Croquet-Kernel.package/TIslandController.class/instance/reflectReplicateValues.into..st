initialize
reflectReplicateValues: valueRef  into:  ocRef

	ocRef future addLast: ( self senderID copy  ->  valueRef value).