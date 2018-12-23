as yet unclassified
processEventBuffer: evtBuf
	| evt type |
	evt := nil.	"for unknown event types"
	type := evtBuf first.
	type = EventTypeMouse ifTrue: [
		evt := self generateMouseEvent: evtBuf.
	].
	type = EventTypeKeyboard 
		ifTrue: [evt := self generateKeyboardEvent: evtBuf].
	type = EventTypeDragDropFiles 
		ifTrue: [evt := self generateDropFilesEvent: evtBuf].
	"All other events are ignored"
	(type ~= EventTypeDragDropFiles and: [evt isNil]) ifTrue: [^self].
	evt ifNotNil:[self handleEvent: evt].