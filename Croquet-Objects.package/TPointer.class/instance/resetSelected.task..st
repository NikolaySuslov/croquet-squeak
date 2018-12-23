picking
resetSelected: event task: task
	| lastSel sel lastTarget target |

	sel := selection frameID.
	target := selection target.
	selection target: nil.
	lastSel := lastSelection frameID.
	lastTarget := lastSelection target.
	lastSelection target: nil.
	pointerDown ifFalse:[
	lastSel ~= sel ifTrue:[
" ------ pointer has left the lastSel "
		lastSel ifNotNil:[
			event selection: selection.
			task doPointerLeave: event.
		].
" ------ pointer has entered the sel "
		sel ifNotNil:[
			event selection: selection.
			task doPointerEnter: event.
		].
	] ifFalse: [
" ------ pointer is still inside the same target "
		sel ifNotNil:[
			event selection: selection.
			task doPointerOver: event.
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
