snapshot
restore: data
	"Restore a snapshot of an island"
	| reader newIsland |
	reader := TSnapshotReader new.
	newIsland := reader readObjectFrom: data readStream.
	newIsland send:[:obj| obj controller: self].
	^newIsland


"
	| newIsland refId |
	newIsland := super restore: data.
	restoringFromCache = true \ifTrue: [
		refId := newIsland myName.
		newIsland send: [:i | i compactNameMap: refId.].
		self setRouterTime: (newIsland get: #time).
	].
	^newIsland."