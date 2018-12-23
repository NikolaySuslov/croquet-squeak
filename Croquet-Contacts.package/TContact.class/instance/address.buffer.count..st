accessing
address: hostAddress buffer: aByteArray count: count

	address := hostAddress.
	buffer := aByteArray copy.
	port := buffer unsignedShortAt: 5 bigEndian: true.
	id := TObjectID readHexFrom: (buffer copyFrom: 7 to: 38) asString.
	name := (buffer copyFrom: 39 to: count) asString.
	controller := nil.