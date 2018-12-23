testing
strings
	"Get Smalltalk Strings from byte data."

	^ externalStrings collect: 
		[:string | 
		(ExternalData fromHandle: string type: ExternalType char asPointerType) fromCString]