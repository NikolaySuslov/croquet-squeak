instance creation
prototype: aTFrame
	aTFrame ifNil:[^protoData := nil].
	protoData := TIslandCopier new export: aTFrame.
