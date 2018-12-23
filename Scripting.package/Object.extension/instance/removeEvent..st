*Scripting-Extensions
removeEvent: eventName
	self removeEvent: eventName map: (self myEventMap ifNil:[^self]).