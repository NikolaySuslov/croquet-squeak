actions
scaleBox: pointer

	| delta delta2 c1 c2 |
	delta := pointer selectedPoint - selectedPoint.
	delta2 := delta * selectedCorner.
"delta is currently defined in terms of the selectedFrame - need to convert to this frame"
	delta := selectedFrame orientation localPointToGlobal: delta.
	selectedFrame translation: selectedFrame translation + delta.
	delta2 := selectedFrame orientation abs localPointToGlobal: delta2.
	c1 := (self getBox: contents) center.
	contents extent: contents extent+delta2.
	c2 := (self getBox: contents) center.
	contents translation: contents translation + c1-c2 + (self orientation localPointToGlobal:(delta/2.0)).

