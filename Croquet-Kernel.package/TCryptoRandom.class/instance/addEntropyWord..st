accessing
addEntropyWord: value
	"This method adds a word to the entropy pool."
	| w mask |
	w := self rotate: value by: rotate.
	poolIndex := poolIndex - 1.
	poolIndex > 0 ifTrue:[
		rotate := (rotate + 7) bitAnd: 31.
	] ifFalse:[
		"At the beginning of the pool, add an extra 7 bits
		rotation, so that successive passes spread the
		input bits across the pool evenly."
		rotate := (rotate + 14) bitAnd: 31.
		poolIndex := PoolWords.
	].
	"XOR in the various taps"
	mask := PoolMask.
	w := w bitXor: (pool at: (poolIndex + TAP1 bitAnd: mask) + 1).
	w := w bitXor: (pool at: (poolIndex + TAP2 bitAnd: mask) + 1).
	w := w bitXor: (pool at: (poolIndex + TAP3 bitAnd: mask) + 1).
	w := w bitXor: (pool at: (poolIndex + TAP4 bitAnd: mask) + 1).
	w := w bitXor: (pool at: (poolIndex + TAP5 bitAnd: mask) + 1).
	w := w bitXor: (pool at: poolIndex).
	pool at: poolIndex put: ((w bitShift: -3) bitXor: (TwistTable at: (w bitAnd: 7) + 1)).
