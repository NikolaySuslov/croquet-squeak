initialize
makeInplaceArrows
	| cc |
	cc := Color black.
	leftButton := self makeButton: 'Left'.
	leftButton beBordered.
	leftButton labelColor: cc; highlightColor: Color black.
	leftButton listDirection: #topToBottom; cellPositioning: #topLeft.
	self runScript: #leftButtonScript when:{leftButton. #fire}.
	leftButton borderWidth: 0; color: Color transparent.
	leftButton addMorphFront: (LineMorph arrowFrom: 20@0 to: 0@0 width: 2 color: cc).

	rightButton := self makeButton: 'Right'.
	rightButton beBordered.
	rightButton labelColor: cc; highlightColor: Color black.
	rightButton listDirection: #topToBottom; cellPositioning: #topRight.
	rightButton borderWidth: 0; color: Color transparent.
	self runScript: #rightButtonScript when:{rightButton. #fire}.
	rightButton addMorphFront: (LineMorph arrowFrom: 0@0 to: 20@0 width: 2 color: cc).