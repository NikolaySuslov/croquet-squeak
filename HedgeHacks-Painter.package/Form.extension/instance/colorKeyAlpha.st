*HedgeHacks-Painter
colorKeyAlpha
	"Form fromUser colorKeyAlpha displayOn: Display at: 0@0 rule: Form paint"
	"Use the first color in the form as a bit mask."
	| pv |
	[(BitBlt toForm: self)
		fillColor: (self colorAt: 0@0);
		combinationRule: 39;
		copyBits] on: Error do:[:ex|
		pv := bits at: 1.
		1 to: bits size do:[:i|
			(bits at: i) = pv ifTrue:[bits at: i put: 0]].
		ex return].
