testing
isTriggeredBy: signaler
	"Answer true if this script is triggered by an event from the given signaler"
	eventSpec ifNil:[^false].
	1 to: eventSpec size by: 2 do:[:i| (eventSpec at: i) == signaler ifTrue:[^true]].
	^false