double dispatching
printOn: aStream
	"Print the receiver on aStream"
	1 to: 4 do:[:r|
		1 to: 4 do:[:c| 
			(self at: r-1*4+c) printOn: aStream.
			aStream nextPut: Character space].
		(r < 4) ifTrue:[aStream nextPut: Character cr]].