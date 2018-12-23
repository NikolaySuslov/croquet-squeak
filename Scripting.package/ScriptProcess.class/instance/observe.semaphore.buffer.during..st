private-events
observe: eventSpec semaphore: aSemaphore buffer: aBuffer during: aBlock
	| handler |
	handler := self observe: eventSpec semaphore: aSemaphore buffer: aBuffer.
	^[aBlock value: handler] 
		ensure:[myHandler := myHandler releaseTo: handler nextHandler].