initialize
initialize
	super initialize.
	tickMsg := TMessageData new.
	tickPeriod := 1000.
	syncFacets := Dictionary new.