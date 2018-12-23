*Scripting-Extensions
on: eventName notify: anObserver
	"Notify the observer when the given event is triggered."
	| map list |
	eventName ifNil:[^self].
	map := self myEventMap.
	map ifNil:[self myEventMap: (map := self newEventMap)].
	list := map at: eventName ifAbsentPut:[WeakArray new: 1].
	1 to: list size do:[:i|
		(list at: i) ifNil:[^list at: i put: anObserver].
	].
	map at: eventName put: (list copyWith: anObserver).
	^anObserver
