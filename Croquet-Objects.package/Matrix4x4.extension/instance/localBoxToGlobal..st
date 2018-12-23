*Croquet-Objects
localBoxToGlobal: aTBox

	^TBox min: (self localPointToGlobal: aTBox min) max: (self localPointToGlobal: aTBox max).