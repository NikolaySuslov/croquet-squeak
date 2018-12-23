library
makeLibrary
	| sketchList cc top scroller button |
	sketchLib ifNotNil:[
		sketchLib delete.
		sketchLib := nil.
		window extent: window content submorphBounds extent.
		^self].
	cc := (Color r: 0.7 g: 0.7 b: 0.4).
	top := sketchLib := Morph new.
	top color: (Color white mixed: 0.4 with: cc).
	top borderStyle: (BorderStyle complexAltInset width: 3).
	top borderStyle baseColor: cc.
	top extent: window content width @ 84.
	top layoutPolicy: TableLayout new.
	top listDirection: #leftToRight.
	top hResizing: #spaceFill; vResizing: #shrinkWrap.
	window addMorphBack: top.

	scroller := TransformMorph new.
	scroller color: Color transparent.
	scroller height: 84.
	scroller width: (window content innerBounds width truncateTo: 68) + 2.
	"scroller hResizing: #spaceFill."
	scroller clipSubmorphs: true.
	top addMorphBack: scroller.

	button := self makeButton:'<'. button layoutInset: 0.
	button wrapCentering: #center.
	button fillStyle direction: 0@80.
	button hResizing: #spaceFill; vResizing: #spaceFill.
	self startScript: #scrollBack: withArguments:{scroller} when:{button. #fire}.
	top addMorphFront: button.

	button := self makeButton:'>'. button layoutInset: 0.
	button hResizing: #spaceFill; vResizing: #spaceFill.
	button wrapCentering: #center.
	button fillStyle direction: 0@80.
	self startScript: #scrollForward: withArguments:{scroller} when:{button. #fire}.
	top addMorphBack: button.

	sketchList := Morph new color: Color transparent.
	sketchList layoutPolicy: TableLayout new.
	sketchList listDirection: #leftToRight.
	sketchList hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	sketchList layoutInset: 2@4; cellInset: 2.
	scroller addMorphBack: sketchList.
"
	self waitTick.
	self startScript: #updateLibrary: withArguments:{sketchList}.
"
	Cursor wait showWhile:[self updateLibrary: sketchList].