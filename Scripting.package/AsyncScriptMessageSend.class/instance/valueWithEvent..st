evaluating
valueWithEvent: anEvent

	"Serialize access since different processes may get here at the same time"
	self accessLock critical:[ | myScript proc |
		myQueue ifNil:[myQueue := ScriptEventList new].
		myQueue addLast: anEvent.
		myProcess ifNotNil:[^self].
		proc := (ScriptProcess forIsland: myIsland) newScript.
		proc message: self.
		proc owner: self.
		proc setScheduler: myScheduler.
		proc event: anEvent.
		(myScript := Processor activeProcess) traceEvents ifTrue:[
			myScript traceEvent: anEvent message: self script: proc.
			proc eventTracer: myScript eventTracer.
			proc traceEvents: true.
		].
		proc hand: myScript hand.
		myProcess := proc.
		myProcess primitiveResume. "needs to be primitive to make this and prev statement atomic"
	].
	^myProcess
