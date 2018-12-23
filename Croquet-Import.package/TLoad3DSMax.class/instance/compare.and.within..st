parse
compare: v1 and: v2 within: epsilon

	| delta |
	delta := v1-v2.
	delta x abs > epsilon ifTrue:[^ false].
	delta y abs > epsilon ifTrue:[^ false].
	delta z abs > epsilon ifTrue:[^ false].
	^ true.