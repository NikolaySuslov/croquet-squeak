copying
copy: anObject to: dstIsland
	| data |
	data := self export: anObject.
	^self import: data to: dstIsland.