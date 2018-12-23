*Scripting-Extensions
on: eventName unNotify: anObserver
	"Notify the observer when the given event is triggered."
	| map list |
	map := self myEventMap ifNil:[^self].
	list := map at: eventName ifAbsent:[^self].
	list := list reject:[:any| any == nil or:[any == anObserver]].
	list size = 0 
		ifTrue:[self removeEvent: eventName map: map]
		ifFalse:[map at: eventName put: list].
