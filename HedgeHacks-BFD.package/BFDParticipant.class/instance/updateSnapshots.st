snapshots
updateSnapshots
	(harness snapshots) = (dock snapshots collect:[:each| each snapshot]) ifFalse:[
		dock snapshots: (harness snapshots collect:[:each| TSnapshotMorph new snapshot: each])
	].
