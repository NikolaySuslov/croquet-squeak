accessing
withDroppedEventsDo: aBlock
	"Evaluate aBlock with the receiver and all dropped events from the oldest to the newest."
	self priorEvent ifNotNilDo:[:evt| evt withDroppedEventsDo: aBlock].
	^aBlock value: self