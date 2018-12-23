zoom navigator
makeWindowIn: anIsland
	"Create a window in the given space. This is an ugly solution but it works..."
	windowData ifNil:[windowData := TIslandCopier new export: TWindow new].
	^TIslandCopier new import: windowData to: anIsland.