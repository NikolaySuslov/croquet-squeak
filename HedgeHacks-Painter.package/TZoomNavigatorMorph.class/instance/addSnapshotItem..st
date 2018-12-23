snapshot items
addSnapshotItem: aSketch
	snapshots add: aSketch.
	(scroller submorphs first valueOfProperty: #contentType) == #snapshots ifFalse:[^self].
	self addItem: aSketch
		dragAction: nil
		clickAction: (MessageSend receiver: self selector: #clickSnapshot: argument: aSketch).