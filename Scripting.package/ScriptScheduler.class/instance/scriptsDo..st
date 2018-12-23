scheduling
scriptsDo: aBlock
	"Evaluate aBlock for all scripts associated with the receiver.
	NOTE: Some scripts may never have been activated before.
	Because of this they are not (yet) in the scheduled list but
	waiting on the active list to be scheduled. To enumerate these
	scripts as well we need to check the processes waiting in the
	active list for any that have not been started yet."
	| link |
	link := scheduledList.
	[link == nil] whileFalse:[
		link process == nil ifFalse:[aBlock value: link process].
		link := link nextLink.
	].
	link := activeList firstOrNil.
	[link == nil] whileFalse:[
		link isStarted ifFalse:[aBlock value: link].
		link := link nextLink].