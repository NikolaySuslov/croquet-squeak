islands
addIsland: isl postcard: pc

	| key |
	(key := pc routerName) ifNotNil:[islandsByName at: key put: isl].
	(key := pc routerID) ifNotNil:[islandsByID at: key put: isl].
