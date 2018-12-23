initialization
initialize

	| rloc row cloc tm x y z |
	super initialize.
	self color: Color transparent.
	self layoutPolicy: nil.
	self hResizing: #rigid.
	self vResizing: #rigid.
	numRows := 27.
	numColumns := 16.
	colWidth := OrderedCollection new.
	rowHeight := OrderedCollection new.
	numColumns timesRepeat:[colWidth add:64].
	numRows timesRepeat:[rowHeight add:28].
	rows := OrderedCollection new.
	top := 0.
	left := 0.
	rloc := top.
	1 to: numRows do:[:r |
		row := OrderedCollection new.
		cloc := left.
		1 to: numColumns do:[:c|
			tm:=SpreadSheetField new initialize: self row: r column:c.
			row add: tm.
			tm extent: (colWidth at: c)@(rowHeight at:r).
			tm position: cloc@rloc.
			cloc := cloc + (colWidth at: c).
			(r = 1 or:[c = 1])ifTrue:[
				c = 1 ifTrue:[ 
					r = 1 ifTrue:[tm contents:''.] 
				ifFalse:[tm contents: '[',((r-1) asString),']'.]
				]
					ifFalse:[tm contents: ($A asInteger + c-2)asCharacter asString.].
			tm margins: 4@0;centered.
			tm fontName: #ComicBold size: 18; textColor: Color blue; backgroundColor: Color white.
			] ifFalse:[
			"compute the Sombrero function."
			x:=((c-(numColumns/2.0)) * 5.0/numColumns).
			y:=((r-(numRows/2.0))* 5.0/numRows).
			z := (((x*x)+(y*y)) cos) asString.
			z size > 6 ifTrue:[
				z := z copyFrom: 1 to:6.].
			tm contents: (z,'  ').
			].
			self addMorph: tm.
			].
		rows add: row.
		rloc := rloc + (rowHeight at: r).
	].
	self extent: cloc@rloc.
		