initialize
breakPromises
	"Break any unresolved promises"
	connections do: [:con |
		con promises do: [:ea | ea resolve: false].
		con promises: Dictionary new]