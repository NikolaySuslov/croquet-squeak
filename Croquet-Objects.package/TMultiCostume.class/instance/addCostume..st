accessing
addCostume: cstm

	costumes ifNil:[costumes:= OrderedCollection new. ].
	costumes add: cstm.
	cstm solidTree: false.
	costume ifNil:[self selectCostume: 1].
	