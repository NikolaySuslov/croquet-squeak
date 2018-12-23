events
pointerMove: event

	| pointer |
	selectedFrame ifNotNil:[
		pointer := event makePointer.
		selectedAction ifNotNil:[ 
			self perform: selectedAction with: pointer. 
			self parentChanged: contents.
		].
	].