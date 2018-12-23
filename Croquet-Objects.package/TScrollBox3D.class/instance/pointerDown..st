events
pointerDown: event

	| trans |
	shiftPressed := event shiftPressed.
	selectedFrame := event selection frame parent.
	selectedFrame = self ifTrue:[selectedFrame := nil. ^self].
	(selectedFrame hasAncestorOrMe: contents) ifTrue:[selectedFrame := nil. ^self].

	trans := event selection frame translation.
	selectedPoint := event selection point + trans.
	selectedAction := event selection frame objectName.
	boxPoint := (selectedFrame localTransform localPointToGlobal: selectedPoint).	
	selectedAction = #doEdge: ifTrue:[ rotPoint := nil. self calcRotateDimension.]
	ifFalse:[
		selectedCorner := (trans x/trans x abs)@(trans y/trans y abs)@0.0.
	].

	basePosition := selectedFrame frameChildren collect:[:fc | fc translation.].
	baseLength := selectedPoint length.
	baseScale := contents scale.
	newScale := 1.0.
	selectedFrame frameChildren do:[:fc | fc material: matDown.].
