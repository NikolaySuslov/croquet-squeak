importing
importArray
	"Export an array"
	| sz array |
	sz := dataStream nextUInt32.
	array := Array new: sz.
	1 to: sz do:[:i| array at: i put: self importNext].
	^array