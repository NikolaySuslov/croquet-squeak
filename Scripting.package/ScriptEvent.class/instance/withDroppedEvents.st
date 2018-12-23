accessing
withDroppedEvents
	"Return an array of events that contain the receiver and all dropped events from the oldest to the newest (e.g., in reverse order of prior events)."
	^(self droppedEventStreamOfSize: 0) contents