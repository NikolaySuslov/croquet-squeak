synchronization
transferTo: aList
	"Transfer the receiver to another list to wait on"
	myList ifNil:[self error:'Not on any list'].
	myList remove: self.
	aList addLast: self.
	myList := aList.