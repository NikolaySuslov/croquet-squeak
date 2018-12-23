router switching
connectionsDo: aBlock
"Do aBlock for the connections, in round-robin order, starting with the first fallback connection, and ending with the primary connection"

	| primary |
	self critical: [ "Don't want the connections changing during enumeration"
		primary := connections indexOf: connection.
		connections from: primary + 1 to: connections size do: aBlock.
		connections from: 1 to: primary do: aBlock]