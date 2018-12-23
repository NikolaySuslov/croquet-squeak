parse
showArray: array entries: depth title: title

		Transcript show: title; cr.
		1 to: depth do:[ :j | 
			Transcript show: (array at: j) asString; cr.
			]

