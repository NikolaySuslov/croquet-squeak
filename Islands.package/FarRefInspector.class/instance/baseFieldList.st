accessing
baseFieldList
	"Answer an Array consisting of 'self'
	and the instance variable names of the inspected object."
	(object isFarRef)
		 ifFalse:[^super baseFieldList].
	^(Array with: 'self' with: 'all inst vars')
			, (self actualClassOf: object) allInstVarNames