snapshot items
addSnapshots
	self addBackButton: #snapshots.
	snapshots do:[:item|
		self addItem: item
			dragAction: nil
			clickAction: (MessageSend receiver: self selector: #clickSnapshot: argument: item)].