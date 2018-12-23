*Islands
setIsland: newIsland
	"Initialize processes by default with the inherited island from the parent process"
	island := newIsland.
	island ifNotNil:[island noteNewProcess: self].
