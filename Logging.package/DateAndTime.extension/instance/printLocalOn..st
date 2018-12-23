*logging-core
printLocalOn: aStream
	"Print as per ISO 8601 sections 5.3.3 and 5.4.1.
	
	ignore the timezone offset
	
	If printLeadingSpaceToo is false, prints either:
		'YYYY-MM-DDThh:mm:ss.s' (for positive years) or '-YYYY-MM-DDThh:mm:ss.s' (for negative years)
	If printLeadingSpaceToo is true, prints either:
		' YYYY-MM-DDThh:mm:ss.s' (for positive years) or '-YYYY-MM-DDThh:mm:ss.s' (for negative years)
	"

	self printYMDOn: aStream withLeadingSpace: false.
	aStream nextPut: $T.
	self printHMSOn: aStream.
	self nanoSecond ~= 0 ifTrue:
		[ | z ps |
		ps := self nanoSecond printString padded: #left to: 9 with: $0.
		z := ps findLast: [ :c | c asciiValue > $0 asciiValue ].
		(z > 0) ifTrue: [aStream nextPut: $.].
		ps from: 1 to: z do: [ :c | aStream nextPut: c ] ].
