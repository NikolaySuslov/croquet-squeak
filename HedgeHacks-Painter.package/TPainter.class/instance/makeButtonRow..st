initialize
makeButtonRow: ww
	| buttonRow cc button |
	cc := (Color r: 0.7 g: 0.7 b: 0.4).
	buttonRow := Morph new.
	buttonRow borderStyle: (BorderStyle complexAltInset width: 2).
	buttonRow borderStyle baseColor: cc.
	buttonRow color: Color transparent. "(Color white alpha: 0.5)."
	buttonRow layoutPolicy: TableLayout new.
	buttonRow listDirection: #leftToRight.
	buttonRow height: 25.

	leftButton := button := self makeButton: 'Left'.
	self runScript: #leftButtonScript when:{leftButton. #fire}.
	button addMorphFront: (LineMorph arrowFrom: 20@0 to: 0@0 width: 2).
	button hResizing: #rigid; width: 100.
	buttonRow addMorphBack: button.

	button := self makeButton: '... More stuff...'.
	button hResizing: #spaceFill.
	buttonRow addMorphBack: button.

	rightButton := button := self makeButton: 'Right'.
	self runScript: #rightButtonScript when:{rightButton. #fire}.
	button addMorphBack: (LineMorph arrowFrom: 0@0 to: 20@0 width: 2).
	button hResizing: #rigid; width: 100.
	buttonRow addMorphBack: button.

	button := self makeButton: 'Expert'.
	button hResizing: #rigid; width: ww.
	buttonRow addMorphBack: button.
	^buttonRow