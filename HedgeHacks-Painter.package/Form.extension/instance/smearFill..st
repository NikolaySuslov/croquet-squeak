*HedgeHacks-Painter
smearFill: nPix
	"Fill transparent pixels in the receiver at most nPix."
	| newForm |
	newForm := Form extent: self extent depth: depth.
	1 to: nPix do:[:i|
		self displayOn: newForm at: 0@1 rule: Form paint.
		self displayOn: newForm at: 0@-1 rule: Form paint.
		self displayOn: newForm at: 1@0 rule: Form paint.
		self displayOn: newForm at: -1@0 rule: Form paint.
		self displayOn: newForm at: 0@0 rule: Form paint.
		newForm displayOn: self].
	^self