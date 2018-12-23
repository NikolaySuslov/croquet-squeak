events
pointerMove: event
	"Same as superclass, but with different event numbers."

	eventNum ifNil: [^ self].

"RESIZE THE WINDOW"
	(#(0.125 0.375 0.625 0.875) includes: eventNum) ifTrue:[ ^ self resizeWindow: event. ].

"ROTATE AROUND THE Y-AXIS"
	(#(0.25 0.75) includes: eventNum) ifTrue: [ ^ self rotateWindow: event.].

" MOVE THE WINDOW PERPENDICULAR TO THE CAMERA"
	(eventNum = 0.0 ) ifTrue:[ ^ event shiftPressed ifTrue:[self zoomWindow: event.]
	ifFalse:[self moveWindow: event.]].
" MOVE THE WINDOW PARALLEL TO THE CAMERA "
	(eventNum = 0.5) ifTrue:[ ^ event shiftPressed ifTrue:[self moveWindow: event.]
		ifFalse:[self zoomWindow: event.].].
