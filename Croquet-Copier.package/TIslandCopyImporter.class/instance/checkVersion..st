importing
checkVersion: aStream
	| version |
	version := (aStream next: 4) asString.
	version = TIslandCopier version ifTrue:[^false]. "no byte reversal"
	version = TIslandCopier version reversed ifTrue:[^true]. "do byte reversal"
	^self error:'Invalid version info'