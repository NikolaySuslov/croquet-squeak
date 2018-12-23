class initialization
cleanup

3 timesRepeat:[
	Processor activeIsland flushGlobals.
	Transcript show:(TIsland allInstances do:[:i | i flushGlobals.]);cr. 
	Transcript show:(TFarRef allInstances do:[:fr | fr destroy]);cr.
	Transcript show:(CroquetHarness allInstances do:[:ch | ch destroy]);cr.
	Transcript show:(TAvatarUser allInstances do:[:au | au destroy]);cr.
	Transcript show:(TSimpleController allInstances do:[:sc | sc destroy]);cr.
	Transcript show:(ScriptMessageSend allInstances do:[:sms | sms terminateScript]);cr.
	Transcript show:(Smalltalk garbageCollect);cr.
]
