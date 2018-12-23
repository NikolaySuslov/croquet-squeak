as yet unclassified
named: aName
	
	| logs |
	
	logs := self windowsIn: self currentWorld satisfying: [ :w | w class = self and: [ w origLabel = aName ] ].
	
	logs ifEmpty: [ ^ nil ].

	^ logs first

