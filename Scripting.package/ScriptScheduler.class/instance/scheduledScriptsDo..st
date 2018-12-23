scheduling
scheduledScriptsDo: aBlock
	"Evaluate aBlock for all scripts scheduled in the receiver."
	| link |
	link := scheduledList.
	[link == nil] whileFalse:[
		link process == nil ifFalse:[aBlock value: link process].
		link := link nextLink.
	].