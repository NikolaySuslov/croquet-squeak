private
contentsOf: theItem 
	| isMeta |
	isMeta := theItem class isMeta.
	
	theItem class allInstVarNames keysAndValuesDo: [:index :each |
		index = 1 ifTrue: [ 
			self title: (isMeta ifTrue: [ 'class ' ] ifFalse: [ '' ]),'Named Slots' ].
		(router << each << ': ' << (theItem instVarAt: index)) cr.
	].		 
	(1 to: theItem basicSize) do: [:index |
		index = 1 ifTrue: [ self title: 'Indexed Slots' ].
		(router << index << ': ' << (theItem instVarAt: index)) cr.  
	].
	router endEntry.
	
