accessing
selectCostume: index

	costumes ifNotNil:[
		costumes size >= index ifTrue:[
			costume ~= (costumes at: index) ifTrue:[
				costume ifNotNil:[self removeChild: costume.].
				costume := costumes at: index.
				self addChild: costume.
			].
		].
	].