events
getAllEventsHandled

" this finds the entire hierarchical event list. Even though this child may not handle an event, it's parent might"
	frameParent ifNotNil:[
		^self eventMask bitOr:frameParent objectOwner getAllEventsHandled.
	] ifNil:[ ^ self eventMask.].
	