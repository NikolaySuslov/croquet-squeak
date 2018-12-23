events
pointerUp: event
	event selection frame == menuTxtr ifTrue:[
		self fireSelectedItem: event.
	].
