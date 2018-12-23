instance creation
makeMorph: morphClass extent: worldExtent from: tform
	| host morph |
	morph := morphClass new.
	(morph respondsTo: #noteTForm:) ifTrue:[morph noteTForm: tform].
	host := self new initializeWithMorph: morph thumb: tform extent: worldExtent.
	host redraw.
	TMorphicForm registerHost: host.