instance creation
new
	protoData ifNil:[^self basicNew initialize].
	^TIslandCopyImporter new importData: protoData.