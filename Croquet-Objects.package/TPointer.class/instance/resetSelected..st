picking
resetSelected: event
	| lastSel sel eventHandled lastEventHandled lastTarget target |

	sel := selection frameID.
	target := selection target.
	selection target: nil.
	eventHandled := selection eventMask.
	lastSel := lastSelection frameID.
	lastTarget := lastSelection target.
	lastSelection target: nil.
	lastEventHandled := lastSelection eventMask.
	pointerDown ifFalse:[
"This is a bit trick when we take tasks into account. I need to add a task model to this without interfering with the logic. To be continued..."
	lastSel ~= sel ifTrue:[
" ------ pointer has left the lastSel "
		lastSel ifNotNil:[
			(lastEventHandled anyMask:EventPointerOver) ifTrue:[
				event selection: selection.
				lastTarget future doPointerLeave: event.
			].
		].
" ------ pointer has entered the sel "
		sel ifNotNil:[
			(eventHandled anyMask:EventPointerOver) ifTrue:[
				event selection: selection.
				target future doPointerEnter: event.
			].
		].
	] ifFalse: [
" ------ pointer is still inside the same target "
		sel ifNotNil:[
			(eventHandled anyMask:EventPointerOver) ifTrue: [
				event selection: selection.
				target future doPointerOver: event.
			].
		].
	].
	].
	selection target: target.
	lastSelection target: lastTarget.
pointerDown ifFalse:[
	lastSelection := selection.
	selection := self newSelection.
].
	selection distance: Float infinity.
	self maxDistance: Float infinity.
