events
stopDrag: evt frame: aFrame
	"Mouse down in window frame"
	aFrame on: #mouseMove send: nil to: nil.
	aFrame removeProperty: #dragOrigin.
	evt hand showTemporaryCursor: nil.
	self removeDropShadow.