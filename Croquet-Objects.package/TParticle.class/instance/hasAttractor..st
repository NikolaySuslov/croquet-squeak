accessing
hasAttractor: attr

	attractors do:[:a | a = attr ifTrue:[^ true]].	
	^ false.