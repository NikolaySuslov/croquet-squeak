*Scripting-Extensions
handlesAnyOf: eventList
	| map |
	map := self myEventMap ifNil:[^false].
	eventList do:[:evtName| (self handlesEvent: evtName map: map) ifTrue:[^true]].
	^false