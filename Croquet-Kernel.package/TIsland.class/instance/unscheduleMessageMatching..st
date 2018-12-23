event loop
unscheduleMessageMatching: aBlock
	"Unschedule any single message matching aBlock."
	1 to: messageQueue size do:[:i|
		(aBlock value: (messageQueue at: i)) ifTrue:[^messageQueue removeAt: i].
	].
	^nil