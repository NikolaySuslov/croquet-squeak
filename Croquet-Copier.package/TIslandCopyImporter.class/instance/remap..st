importing
remap: dataSet
	"Remap the given object to an export data reference"
	dataSet class == TIslandCopyData ifFalse:[^dataSet].
	^refMap at: dataSet ifAbsent:[self import: dataSet].