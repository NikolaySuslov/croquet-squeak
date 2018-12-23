library
makeLibraryButtonFrom: file
	| form holder cc sketch label colorKey |
	cc := (Color r: 0.7 g: 0.7 b: 0.4).
	form := Form fromBinaryStream: file.
	colorKey := form colorAt: 0@0.
	colorKey = Color transparent ifFalse:[
		form replaceColor: colorKey withColor: Color transparent.
	].
	holder := Morph new color: (Color white mixed: 0.7 with: cc).
	holder extent: 66@76.
	holder borderStyle: (BorderStyle width: 1 color: Color black).
	holder clipSubmorphs: true.
	holder cornerStyle: #rounded.
	sketch := SketchMorph withForm: form.
	sketch extent: sketch extent * (64.0 / (form width max: form height)).
	sketch position: 64 - sketch extent // 2 + 1.
	holder addMorphBack: sketch.
	label := StringMorph contents: (file localName allButLast: 4).
	label width < sketch width ifTrue:[
		label align: label bounds bottomCenter with: holder innerBounds bottomCenter.
	] ifFalse:[
		label align: label bounds bottomLeft with: holder innerBounds bottomLeft.
	].
	holder addMorphBack: label.
	holder on: #mouseDown send: #mouseDownSketch:from: to: self.
	holder on: #mouseUp send: #mouseUpSketch:from: to: self.
	^holder