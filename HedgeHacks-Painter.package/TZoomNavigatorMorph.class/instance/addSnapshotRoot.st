snapshot items
addSnapshotRoot
	snapshots ifNil:[snapshots := OrderedCollection new].
	SnapshotForm ifNil:[SnapshotForm := Form extent: 32@32 depth: 32].
	self addSnapshotRoot: SnapshotForm.