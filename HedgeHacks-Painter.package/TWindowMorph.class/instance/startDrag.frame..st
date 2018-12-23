events
startDrag: evt frame: aFrame
	"Mouse down in window frame"
	owner ifNil:[^self].
	owner firstSubmorph == self ifFalse:[owner addMorphFront: self].
	aFrame setProperty: #dragOrigin toValue: evt position.
	aFrame on: #mouseMove send: #followHand:frame: to: self.
