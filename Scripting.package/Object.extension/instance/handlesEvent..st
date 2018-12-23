*Scripting-Extensions
handlesEvent: eventName
	^self handlesEvent: eventName map: (self myEventMap ifNil:[^false]).