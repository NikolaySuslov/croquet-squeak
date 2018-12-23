parse
nextFieldOn: aStream 
	| name value |
	name := self
				convertTName: (self nextTokenTo: DelimSet2 on: aStream).
	value := self nextTokenTo: DelimSet1 on: aStream.
	^ Array with: name with: value withBlanksTrimmed