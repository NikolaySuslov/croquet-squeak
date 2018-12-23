*Scripting-Extensions
handlesEvent: eventName map: map
	| list |
	list := map at: eventName ifAbsent:[^false].
	1 to: list size do:[:i|
		(list at: i) ifNotNil:[^true].
	].
	self removeEvent: eventName map: map.
	^false