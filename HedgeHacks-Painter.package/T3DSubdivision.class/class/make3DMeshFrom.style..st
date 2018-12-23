instance creation
make3DMeshFrom: aForm style: extrusionStyle
	"
		self make3DMeshFrom: (Form fromFileNamed: 'Sketches\Goat.gif') style: #round
	"
	| list pts subdivision mask |
	mask := Form extent: aForm extent*2 depth: 1.
	(WarpBlt toForm: mask)
		sourceForm: aForm destRect: mask boundingBox;
		combinationRule: Form over;
		cellSize: 1;
		colorMap: (Color maskingMap: aForm depth);
		warpBits.

	subdivision := T3DSubdivision withSize: (mask boundingBox).
	list := mask traceOutlines.
	list := list collect:[:poly|
		poly collect:[:loop|
			pts := StrokeSimplifier new.
			loop do:[:pt| pts add: pt].
			pts closeStroke.
			pts := pts finalStroke.
			pts := StrokeSimplifier smoothen: pts length: 10.
			pts := LineIntersections regularize: pts.
			pts do:[:pt| subdivision insertPoint: pt].
			pts]].
	list := list collect:[:poly|
		poly collect:[:loop| subdivision constraintOutline: loop].
	].

	list do:[:poly|
		poly keysAndValuesDo:[:index :loop|
			subdivision markExteriorEdges: (index = 1) in: loop.
		].
	].
	extrusionStyle == #round
		ifTrue:[^subdivision build3DObject: false].
	extrusionStyle == #flat
		ifTrue:[^subdivision surface].
	^subdivision surface