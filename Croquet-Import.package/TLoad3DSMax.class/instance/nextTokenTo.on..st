parse
nextTokenTo: aCharactorSet on: aStream 
	"Fetch until one of the delimiter characters occured. The delimiter is  
	stored into aheadChar"
	| result |
	aStream atEnd
		ifTrue: [aheadChar := nil.
			^ ''].
	result := aStream upToAnyOf: aCharactorSet.
	aheadChar := result last.
	^ result allButLast