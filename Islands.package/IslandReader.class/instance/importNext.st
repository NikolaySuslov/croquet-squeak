importing
importNext
	| code |
	code := dataStream next.
	^self perform: (ImportCodes at: code)