testing
strings2
	"Get Smalltalk Strings from byte data.  This way is longer, but makes sure that 'pointers' is also correct."

	^ (1 to: externalStrings size) collect: 
		[:ind | 
		(ExternalData 
			fromHandle: (pointers getHandle pointerAt: (ind-1)*4+1)
			type: ExternalType char asPointerType) fromCString]