initialization
strings: stringCollection
	| extern pointerBytes |

	(pointers notNil or: [externalStrings notNil]) ifTrue:
		[self error: 'Pointers have not been freed.'].

	"Allocate space for each string individually, and copy the bytes over."
	externalStrings := stringCollection collect: 
		[:string |
		extern := ExternalAddress allocate: string size + 1.
		1 to: string size do: [:ind | extern byteAt: ind put: (string byteAt: ind)].
		extern byteAt: string size + 1 put: 0.
		extern].

	"Create null-terminated array of pointers to strings."
	pointerBytes := ByteArray new: 4*(stringCollection size + 1).
	pointers := ExternalData fromHandle: pointerBytes type: ExternalType void asPointerType.
	externalStrings withIndexDo: 
		[:string :ind |
		pointerBytes pointerAt: (ind-1)*4 + 1 put: string].
