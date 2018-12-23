importing
importImageSegment
	| data sz |
	sz := dataStream nextUInt32.
	data := WordArrayForSegment new: sz.
	dataStream nextWordsInto: data.
	^data