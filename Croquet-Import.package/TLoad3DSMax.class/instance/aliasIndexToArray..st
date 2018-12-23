convert
aliasIndexToArray: ai

	| alias |

	alias := IntegerArray ofSize: ai size.
	1 to: ai size do:[ :i |
		(ai at: i) ifNil:[alias at: i put: 0.] 
				ifNotNil:[alias at: i put: (ai at: i).].
		].

	^ alias.