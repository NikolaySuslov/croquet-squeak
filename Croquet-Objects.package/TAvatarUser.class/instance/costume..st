accessing
costume: aFrame
	
	costume := aFrame.
	costume ifNotNil:[
		costume future solidTree: false. "don't walk on it!"
	].
	replica future costume: costume.
