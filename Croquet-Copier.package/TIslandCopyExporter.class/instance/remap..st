private
remap: anObject
	"Remap the given object to an export data reference"
	^refMap at: anObject ifAbsentPut:[anObject exportOnIslandCopier: self].