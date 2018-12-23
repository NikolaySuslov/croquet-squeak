messages
step
	| island |

	postcard ifNotNil:[

		island := self findIslandByPostcard: postcard.
		island ifNil:[island := self findContactByPostcard: postcard.].
		island ifNotNil:[
			postcard := nil.
			doRender ifFalse:[self startRender].
		].
	].

	"Yield the processor to the O.S. at least once per frame;
	 this allows background processes (e.g. Gecko) to get at least a few cycles."
	ProcessorScheduler relinquishProcessorForMicroseconds:1000.

	renderProcess ifNil:[
		controllers do:[:each| each critical:[each processMessages]].
	].

	(Smalltalk platformName = 'Win32') ifTrue: [
		ProcessorScheduler relinquishProcessorForMicroseconds: 1000.
	].
	formMgr step.
	avatar updateUser.
