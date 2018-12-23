initialize
initialize

	textureDictionary := Dictionary new.
	findList := Dictionary new.
	sortedFindList := SortedCollection sortBlock:[:a :b | a distance <= b distance].
	updateList := OrderedCollection new.
	mutex := TMutex new.
	cacheMgr := TFileCacheManager new.
	loaderSema := Semaphore new.
	loaderDelay := Delay forMilliseconds: 20.
	self startLoaderProcess.