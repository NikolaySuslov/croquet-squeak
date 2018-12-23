special ops
clampAllFrom: minValue to: maxValue
	"Clamp all elements in the receiver to be in the range (minValue, maxValue)"
	| value |
	1 to: self basicSize do:[:i|
		value := self floatAt: i.
		value := value min: maxValue.
		value := value max: minValue.
		self floatAt: i put: value.
	].