initialize
initialize
	super initialize.
	self clipSubmorphs: true.
	self color: Color transparent.
	scroller := Morph new.
	scroller color: Color transparent.
	scroller layoutPolicy: TableLayout new.
	scroller listDirection: #leftToRight.
	scroller hResizing: #shrinkWrap.
	scroller cellPositioning: #bottomCenter.
	scroller wrapCentering: #bottomRight.
	scroller layoutInset: 4@4.
	scroller cellInset: 4@0.
	scroller height: self largeExtent y + 8. "2 x inset"
	self extent: self smallExtent x * 8 + 8 @ scroller height + 16.
	self addMorph: scroller.
