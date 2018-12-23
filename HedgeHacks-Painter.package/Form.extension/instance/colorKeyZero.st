*HedgeHacks-Painter
colorKeyZero
	| pv |
	[(BitBlt toForm: self)
		fillColor: Color transparent;
		combinationRule: 39;
		copyBits] on: Error do:[:ex|
		pv := 0.
		1 to: bits size do:[:i|
			(bits at: i) = pv ifTrue:[bits at: i put: 0]].
		ex return].
