*Scripting-Extensions
removeEvent: eventName map: eventMap
	eventMap removeKey: eventName ifAbsent:[].
	eventMap size = 0 ifTrue:[self myEventMap: nil].