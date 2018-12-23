accessing
allForIsland: island do: block

	self
		do: [ :each |
			(each sameIslandAs: island )
				ifTrue: [ block value: each ]
		].