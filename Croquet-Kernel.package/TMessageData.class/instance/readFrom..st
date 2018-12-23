read/write
readFrom: aStream
	| count |
	receiver := aStream nextInto: (TObjectID nilObjectID).
	count := aStream nextNumber: 4.
	selector := (aStream next: count) asString asSymbol.
	count := aStream nextNumber: 4.
	arguments := aStream next: count.
	sender := aStream nextInto: (TObjectID nilObjectID).
	msgId := aStream nextInto: (TObjectID nilObjectID).
	time := Float basicNew: 2.
	time basicAt: 1 put: (aStream nextNumber: 4).
	time basicAt: 2 put: (aStream nextNumber: 4).
	sid := aStream nextNumber: 4.