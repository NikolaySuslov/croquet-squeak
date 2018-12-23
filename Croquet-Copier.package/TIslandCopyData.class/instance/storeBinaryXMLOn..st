printing
storeBinaryXMLOn: writer
	| str |
false ifTrue:[
	binary class isWords ifTrue:[
		str := self wordStringOf: binary.
	] ifFalse:[
		str := String new: binary basicSize.
		str replaceFrom: 1 to: str size with: binary startingAt: 1.
	].
	str := (Base64MimeConverter mimeEncode: (ReadStream on: str)) contents.
	writer attribute: 'encoding' value:'base64'.
	writer attribute: 'order' value: Smalltalk endianness.
	writer attribute: 'data' value: str.
].
	writer endEmptyTag: refClass name.