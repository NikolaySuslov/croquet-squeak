*Scripting-Extensions
privateSignalEvent: anEvent
	"Signal the occurance of anEvent"
	| map list msg |
	map := self myEventMap ifNil:[^self].
	list := map at: anEvent selector ifAbsent:[^self].
	1 to: list size do:[:i|
		(msg := list at: i) ifNotNil:[msg valueWithEvent: anEvent shallowCopy]].