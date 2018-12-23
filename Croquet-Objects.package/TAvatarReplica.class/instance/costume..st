accessing
costume: cstm 
	
	(costume notNil and: [costume ~= cstm]) ifTrue: [
		self removeChild: costume.
	].
	costume := cstm.
	costume ifNotNil: [
		self addChild: costume.
		costume solidTree: false.
	].