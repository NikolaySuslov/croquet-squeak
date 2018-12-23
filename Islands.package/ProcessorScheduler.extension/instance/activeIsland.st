*Islands
activeIsland
	"Answer the currently active Island."
	^ self activeProcess island ifNil:[Island default]