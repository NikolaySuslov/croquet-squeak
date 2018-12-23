initialize
makePainter
	| box cc paintArea content boxHolder buttonRow |
	cc := (Color r: 0.7 g: 0.7 b: 0.4).
	content := window content.

	boxHolder := Morph new color: (Color white mixed: 0.4 with: cc).
	box := PaintBoxMorph new.
	boxHolder extent: box width @ content innerBounds height.
	boxHolder addMorph: box.
	box position: boxHolder extent - box fullBounds extent // 2.
	boxHolder position: content innerBounds topRight - (box width @ 0).
	content addMorph: boxHolder.

	paintArea := Morph new.
	paintArea position: content position.
	paintArea extent: content extent - (box width@0).
	paintArea borderStyle: (BorderStyle complexAltInset width: 3).
	paintArea borderStyle baseColor: cc.
	paintArea color: Color transparent. "(Color white alpha: 0.5)."
	content addMorphBack: paintArea.

	editor := TSketchEditorMorph new.
	editor teapot: self.
	editor color: Color transparent.
	editor bounds: paintArea innerBounds.
	box focusMorph: editor.
	paintArea addMorphFront: editor.
false ifTrue:[
	buttonRow := self makeButtonRow: boxHolder width.
	buttonRow width: content innerBounds width.
	buttonRow position: paintArea bottomLeft.
	content addMorphBack: buttonRow.
] ifFalse:[
	self makeInplaceArrows.
	editor addMorph: leftButton.
	editor addMorph: rightButton.
	leftButton align:  leftButton fullBounds bottomLeft with: editor bounds bottomLeft.
	rightButton align: rightButton fullBounds bottomRight with: editor bounds bottomRight.
].