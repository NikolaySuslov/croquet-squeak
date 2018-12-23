messages
makeWindow
	windowData ifNil:[windowData := TIslandCopier new export: TWindow new].
	^TIslandCopier new import: windowData to: self activeSpace island.