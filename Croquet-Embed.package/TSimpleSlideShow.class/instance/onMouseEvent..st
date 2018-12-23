events
onMouseEvent: event
	"Filter out clicks if we're running local so that another user cannot change our view"
	(event at: 4) = userID ifFalse:[^nil].
	"Second, filter out all but the mouseDown events"
	(event at: 1) = #mouseDown ifFalse:[^nil].
	(event at: 3) = 1
		ifTrue: [ self displayPrevImage ].
	(event at: 3) = 4
		ifTrue: [ self displayNextImage ].
