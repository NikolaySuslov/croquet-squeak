as yet unclassified
add: anAdapter
	(self find: LogHistory) ifNotNilDo: [ :history | 

		anAdapter value ifNotNilDo: [ :a | history outputTo: a ].
		
		"dont add a second history adapter"
		anAdapter class = LogHistory ifTrue: [ ^ self ] 
	].
	
	(self find: Transcript) ifNotNil: [ ^ self ].
	
	Protect critical: [ super add: anAdapter ].

	^ anAdapter