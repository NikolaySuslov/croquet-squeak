router tests
testBackdoorLatency
	"Test the message roundtrip lateny to the router"
	<timeout: 10>
	| island ref latencyStats avg start label count gcCount |
	"No logging while we're measuring latency"
	log := nil.
	self testMasterStage3.
	island := controller island.
	controller backDoor: router.
	start := Time millisecondClockValue.
	gcCount := Smalltalk vmParameterAt: 7.
	"Run test for five seconds"
	count := 0.
	[Time millisecondClockValue - start < 5000] whileTrue:[
		count := count + 1.
		ref := island future yourself.
		[ref isResolved] whileFalse:[controller processMessages].
	].
	latencyStats := controller latencyStats.
	label := self class name, '>>testBackdoorLatency'.
	Transcript cr; show: '-------------------- ', label, ' -------------------'.
	Transcript crtab; show: 'Count: ', count.
	Transcript crtab; show: 'Min latency: ', latencyStats min asFloat, ' ms'.
	Transcript crtab; show: 'Max latency: ', latencyStats max asFloat, ' ms'.
	Transcript crtab; show: 'Avg latency: ', (avg := latencyStats average) asFloat, ' ms'.

	gcCount = (Smalltalk vmParameterAt: 7)
		ifFalse:[Transcript crtab; show: '***** FULL GC detected *****'].

	"Average roundtrip latency should be WAY below 5ms for the trivial case"
	self assert: avg < 5.0.
	self assert: count > 1000.