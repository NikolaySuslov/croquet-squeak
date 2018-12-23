as yet unclassified
finish: allDamage
	| fixAlpha |
	form depth = 32 ifTrue:[
		fixAlpha := BitBlt toForm: form.
		fixAlpha combinationRule: 40 "fixAlpha:with:".
	].
	allDamage do:[:r|
		fixAlpha ifNotNil:[fixAlpha destRect: r; copyBits].
		monitor sendDamage: r.
	].
