setup
tearDown
	participant ifNotNil:[
		participant destroy.
		participant := nil.
	].
	controller ifNotNil:[
		controller destroy.
		controller := nil.
	].
	router ifNotNil:[
		router destroy.
		router := nil.
	].
	dispatcher ifNotNil:[
		dispatcher destroy.
		dispatcher := nil.
	].
