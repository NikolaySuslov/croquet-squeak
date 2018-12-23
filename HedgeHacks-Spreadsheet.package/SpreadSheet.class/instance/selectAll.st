initialization
selectAll

	| all |
	all := OrderedCollection new.
	rows do:[:r |
		r do:[:c | all add: c]].
	self highlightFields: all.
		