islands
saveIsland: island on: file
	| writer |
	writer := TIslandWriter new.

	"Prepare the project for saving"
	island portal signal: #shutDownIsland with: false.
	island scheduler run.
	"Checkpoint project"
	Cursor wait showWhile:[
		[writer snapshot: island] ensure:[
			"Start the project again"
			island project signal: #startUpProject with: false.
		].
	].
	writer failed ifTrue:[^self inform: 'Checkpoint failed'].
	Cursor write showWhile:[writer saveObjectOn: file].
	island croquet: self.
