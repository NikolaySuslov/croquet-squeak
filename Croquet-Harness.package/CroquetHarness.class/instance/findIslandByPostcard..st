islands
findIslandByPostcard: pc
	| island |

	island := islandsByID at: pc routerID ifAbsent:[nil].
	island ifNil:[island := islandsByName at: pc routerName ifAbsent:[nil]].
	^ island.