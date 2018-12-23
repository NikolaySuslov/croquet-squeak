accessing
fromData: data

	address := ByteArray readHexFrom: (data at: 'address').
	port := data at: 'port'.
	id := TObjectID readHexFrom: (data at: 'id').
	name := data at: 'name'.
	controller := nil.
	self flushBuffer.