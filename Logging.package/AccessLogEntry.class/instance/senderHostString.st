accessing
senderHostString
	^ senderHost ifNotNil: [NetNameResolver stringFromAddress: senderHost]