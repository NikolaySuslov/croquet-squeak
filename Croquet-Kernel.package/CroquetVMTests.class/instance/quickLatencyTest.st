socket tests
quickLatencyTest
	| server client accepted buf sem1 sem2 procFinished sendTimes time baselineTimes start |
	[
		client := Socket tcpCreateIfFail: [self error: 'socket create failure'].
		server := Socket tcpCreateIfFail: [self error: 'socket create failure'].
		server listenOn: 35553 backlogSize: 8.
		client setOption: 'TCP_NODELAY' value: 1.
		client connectTo: (ByteArray withAll:#(127 0 0 1)) port: 35553.
		accepted := server waitForAcceptFor: 10.
		self deny: accepted == nil.
		buf := ByteArray new: 256.
		client sendData: buf.
		accepted waitForDataIfClosed: [self error: 'connection not working'].
		accepted discardReceivedData.
		sem1 := Semaphore new.

		sendTimes := OrderedCollection new.
		"Do this for a fixed time period, not a fixed number of runs.  
		Reason: when this is running on a platform that it doesn't work 
		well on, it runs orderes of magnitude slower."
		start := Time millisecondClockValue.
		[(Time millisecondsSince: start) < 5000] whileTrue: [
			time := [	"send date; measure roundtrip time"
						procFinished := false.
						accepted discardReceivedData.
						[sem1 signal.
						accepted waitForDataIfClosed: [self halt].
						procFinished := true] forkAt: Processor userInterruptPriority.
						sem1 wait.
						client sendData: buf.
						[procFinished] whileFalse
					] timeToRun.
			sendTimes add: time
		].

		sem2 := Semaphore new.
		baselineTimes := OrderedCollection new.
		1000 timesRepeat: [
			time := [	"measure baseline time"
						procFinished := false.
						accepted discardReceivedData.
						[sem1 signal.
						sem2 wait.
						procFinished := true] forkAt: Processor userInterruptPriority.
						sem1 wait.
						sem2 signal.
						[procFinished] whileFalse.
					] timeToRun.
			baselineTimes add: time
		].
	] ensure:[
		client ifNotNil: [client destroy].
		server ifNotNil: [server destroy].
		accepted ifNotNil: [accepted destroy].
	].
	^ {
		sendTimes average asFloat. 
		sendTimes max. 
		baselineTimes average asFloat. 
		baselineTimes max 
	}