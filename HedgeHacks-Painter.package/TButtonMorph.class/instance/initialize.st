initialize
initialize
	super initialize.
	highlightColor := Color white.
	label := StringMorph new contents: 'Button'.
	label emphasis: 1.
	self addMorphBack: label.
	self layoutPolicy: TableLayout new.
	self listDirection: #leftToRight.
	self hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	self listCentering: #center.
	self layoutInset: 10@2.
	self cellInset: 10@0.
	self fillStyle: (GradientFillStyle colors: {
		Color r: 0.7 g: 0.7 b: 0.4.
		Color r: 1 g: 1 b: 0.95.
	}).
	self fillStyle origin: 0@0.
	self fillStyle direction: 0@18.
	self borderStyle: (BorderStyle complexRaised width: 1).
