snapshot
restore: data newIslandId: islandID
	"Restore a snapshot of an island"
	| reader newIsland oldId idsToChange |
	reader := TSnapshotReader new.
	newIsland := reader readObjectFrom: data readStream.
	newIsland send:[:obj| obj controller: self].
	self setupIslandSignalHandlers.
	islandID
		ifNotNil: [
			oldId := newIsland get: #id.
			idsToChange := TObjectID allInstances select: [ :eachTObjectID | eachTObjectID == oldId].
			idsToChange do: [ :eachId |  "@@@@@ swap new ids with old ids?" ].
		].
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