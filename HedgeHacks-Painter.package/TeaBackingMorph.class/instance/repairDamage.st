rendering
repairDamage
	| rectList fc bb |
	rectList := damageRecorder invalidRectsFullBounds: (0@0 extent: self extent).
	damageRecorder reset.
	bb := BitBlt toForm: texture targetForm.
	bb combinationRule: 40 "fixAlpha:with:".
	bb halftoneForm: (Bitmap with: 16rFF000000).
	fc := (FormCanvas on: texture targetForm).
	rectList do:[:r|
		fc clipBy: r during:[:cc| 
			cc fillColor: Color transparent.
			cc translateBy: bounds origin negated during:[:cc2 | self fullDrawOn: cc2]].
		bb destRect: r.
		bb copyBits.
		texture invalidate: r.
	].