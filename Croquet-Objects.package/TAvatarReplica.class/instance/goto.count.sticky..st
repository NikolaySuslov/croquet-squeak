driving
goto: transform count: count sticky: bool
	" This is used to force the camera to move to a position/orientation. The final location is gotoTransform, and the number of interpolations is in gotoCount."
	sticky := bool.
	snapTrans := self localTransform.
	gotoTransform := transform.
	gotoCount := count.
	self doGoto.