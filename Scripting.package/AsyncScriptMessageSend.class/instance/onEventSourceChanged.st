private
onEventSourceChanged
	"My event source might have changed"
	| oldSource newSource |
	eventSpec ifNil:[^self].
	myTrigger ifNil:[^self].
	oldSource := eventSpec at: 1.
	newSource := [receiver getField: myTrigger field] on: Error do:[:ex| ex return: nil].
	newSource == oldSource ifFalse:[self onUpdateTrigger: newSource from: oldSource].