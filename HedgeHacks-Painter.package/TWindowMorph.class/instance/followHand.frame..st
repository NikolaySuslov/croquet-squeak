events
followHand: evt frame: aFrame
	| origin |
	evt hand showTemporaryCursor: Cursor normal.
	origin := aFrame valueOfProperty: #dragOrigin ifAbsent:[^self].
	self position: self position + (evt position - origin).
	aFrame setProperty: #dragOrigin toValue: evt position.
	"self addDropShadow.
	self shadowColor: (Color black alpha: 0.3)."