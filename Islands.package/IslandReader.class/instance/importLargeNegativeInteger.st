importing
importLargeNegativeInteger
	| sz int |
	sz := dataStream nextUInt32.
	int := LargeNegativeInteger basicNew: sz.
	int replaceFrom: 1 to: sz with: (dataStream next: sz) startingAt: 1.
	^int