export
exportImageSegment: data
	dataStream nextPut: CodeImageSegment.
	dataStream nextUInt32Put: data size.
	dataStream nextWordsPutAll: data.
