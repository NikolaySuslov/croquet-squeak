parsing
makeVertex: args
	| vertex |
	vertex := Vector3
				x: (args at: 2) asNumber
				y: (args at: 3) asNumber
				z: (args at: 4) asNumber.
	vertices add: vertex.