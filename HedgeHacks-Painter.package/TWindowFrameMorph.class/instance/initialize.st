initialize
initialize
	| spacer |
	super initialize.
	self layoutPolicy: TableLayout new.
	self listDirection: #leftToRight.
	self cellPositioning: #leftCenter.
	self hResizing: #spaceFill; vResizing: #shrinkWrap.
	self layoutInset: 4@4; cellInset: 4@0.
	self addMorphBack: (closeButton := self buildCloseButton).
	label := self buildWindowLabel.
	spacer := (Morph new) color: Color transparent; hResizing: #spaceFill; vResizing: #spaceFill.
	spacer clipSubmorphs: true.
	spacer addMorphBack: label.
	self addMorphBack: spacer.
	self addMorphBack: (alphaSlider := self buildAlphaSlider).
	self addMorphBack: (collapseButton := self buildWindowButton).
	self addMorphBack: (expandButton := self buildExpandButton).
