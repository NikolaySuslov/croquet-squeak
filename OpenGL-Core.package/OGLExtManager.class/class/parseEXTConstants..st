class initialization
parseEXTConstants: list
	"Take a list of strings comprising open gl constants, and answer them converted into suitable constant bindings. The elements of the list are expected to follow the semi-standardized rules found in most of the extensions documents, e.g., something like:
		MAX_PALETTE_MATRICES_ARB	0x8842
			=> GLMaxPaletteMatricesARB
		GENERATE_MIPMAP_SGIS			0x8191
			=> GLGenerateMipMapSGIS
		ELEMENT_ARRAY_APPLE			0x8768
			=> GLElementArrayAPPLE
		PIXEL_COUNT_NV					0x8866
			=> GLPixelCountNV
	"
	| parts constName constValue |
	^list collect:[:string|
		parts := string withBlanksTrimmed findTokens:
			(String with: Character space with: Character tab).
		constName := parts first.
		constValue := parts last.
		(constValue beginsWith: '0x') ifTrue:[
			constValue := constValue copyFrom: 3 to: constValue size.
			constValue := Integer readFrom: (ReadStream on: constValue) base: 16.
		] ifFalse:[
			constValue := Number readFrom: (ReadStream on: constValue).
		].
		parts := constName findTokens: '_'.
		constName := String streamContents:[:s|
			s nextPutAll: 'GL'.
			parts allButLast do:[:str| 
				s nextPut: str first asUppercase.
				s nextPutAll: str allButFirst asLowercase.
			].
			s nextPutAll: parts last.
		].
		constName asSymbol -> constValue
	].
