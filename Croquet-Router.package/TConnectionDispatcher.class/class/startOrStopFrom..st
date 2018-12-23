ui
startOrStopFrom: aButton
	Default ifNil:["start default"
		Default := self new.
		Default listenOn: Port.
		aButton color: Color red.
		aButton label: 'Stop Dispatcher'.
	] ifNotNil:["stop default"
		Default destroy.
		Default := nil.
		aButton color: Color green.
		aButton label: 'Start Dispatcher'.
	].