accessing
doForPick: block

"This is essentially a #do: method that stops at a TQuadTree instead of traversing its hierarchy as well. This is to prevent the #pick: methods from being called multiple times for the same TFrame."
	block value: self.
	frameChildren ifNotNil:[ 
		frameChildren do:[ :fc | fc doForPick: block].].
