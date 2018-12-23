public
swapOutObjectOn: aStream

	self flag: #fixMe.	"We ought to be able to use the file"
	dataStream := IslandStream on: (ByteArray new: segment size * 5).
	dataStream nextPutAll: self class objectVersionID.

	"Export data on dataStream"
	self export: imports.
	self exportImageSegment: segment.
	aStream nextPutAll: dataStream contents.
