initialize
destroy
	routers do:[:each| each destroy].
	super destroy.