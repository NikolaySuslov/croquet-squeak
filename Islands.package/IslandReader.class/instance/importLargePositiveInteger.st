importing
importLargePositiveInteger
	| sz int |
	sz := dataStream nextUInt32.
	int := LargePositiveInteger basicNew: sz.
	int replaceFrom: 1 to: sz with: (dataStream next: sz) startingAt: 1.
	^int