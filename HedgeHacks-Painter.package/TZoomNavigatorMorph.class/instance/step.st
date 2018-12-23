event handling
step
	"Step the receiver"
	| height |
	focus ifNotNil:[
		focus framesToDwell: (focus framesToDwell-1).
		focus changed.
	].
	scrollValue ifNotNil:[
		scroller left: scroller left + scrollValue.
		scrollValue < 0 ifTrue:["scroll left"
			scroller right <= bounds right ifTrue:[
				scroller right: bounds right.
				scrollValue := nil].
		] ifFalse:[
			scroller left >= bounds left ifTrue:[
				scroller left: bounds left.
				scrollValue := nil].
		].
		self mouseMove: ActiveHand lastEvent.
	].
	targetHeight ifNotNil:[
		height := owner bottom - self top.
		height = targetHeight ifTrue:[^targetHeight := nil].
		height < targetHeight
			ifTrue:[height := height + 16 min: targetHeight]
			ifFalse:[height := height - 16 max: targetHeight].
		self top: owner bottom - height.
	].