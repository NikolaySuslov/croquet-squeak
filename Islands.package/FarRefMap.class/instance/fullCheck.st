private
fullCheck
	"Keep array at least 1/4 free for decent hash behavior"
	| minFree nowFree |
	minFree := array size // 4 max: 1.
	nowFree := array size - tally.
	nowFree > minFree ifTrue:[^self].
	"Make some room by dumping niled out elements"
	self growTo: array size.
	nowFree := array size - tally.
	nowFree > minFree ifTrue:[
		"Try to shrink if we have very items"
		tally < minFree ifTrue:[self shrink].
		^self].
	"Really grow"
	self grow.