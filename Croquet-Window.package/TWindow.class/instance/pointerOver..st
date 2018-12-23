events
pointerOver: event

	| frm |
	selectedFrame ~= event selection frame ifTrue:[
		selectedFrame := event selection frame.].
	(frm := event selection frame) ifNotNil:[
		frm objectName = 'windowFrame' ifTrue:[
			windowFrame hiliteSection: event selection index.
			^ true]].
	rectFront = event selection frame ifTrue:[
		windowFrame hiliteSection: nil.].
