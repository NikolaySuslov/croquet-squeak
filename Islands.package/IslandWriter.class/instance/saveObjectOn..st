public
saveObjectOn: file
	"This is to be called after 'snapshot', and only once per snapshot.'"

	| data |
	dataStream := IslandStream on: (ByteArray new: segment size * 5).
	dataStream nextPutAll: self class objectVersionID.

	"Export data on dataStream"

	self export: imports.
	self exportImageSegment: segment.

	data := dataStream contents.

	segment := nil.	 "Make these unreachable before the zip phase; every little bit helps."
	imports := nil.
	dataStream := nil.

	archive 
		addDeflateString: data
		as: 'object.isg'.
	archive writeTo: file prepending: self class archiveVersionID.
	^data