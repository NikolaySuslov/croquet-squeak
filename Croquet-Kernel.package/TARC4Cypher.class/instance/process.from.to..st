cypher
process: buffer from: startIndex to: stopIndex
	"Process the given buffer"
	| a b mask xAtY |
	"Try the primitive first"
	xAtY := self primitiveARC4Process: buffer from: startIndex to: stopIndex m: m x: x y: y.
	xAtY ifNotNil:[
		x := xAtY x.
		y := xAtY y.
		^buffer
	].
	startIndex to: stopIndex do:[:i|
		x := (x + 1) bitAnd: 255.
		a := m at: x+1.
		y := (y + a) bitAnd: 255.
		b := m at: y+1.
		m at: x+1 put: b.
		m at: y+1 put: a.
		mask := m at: ((a + b) bitAnd: 255) + 1.
		buffer at: i put: ((buffer at: i) bitXor: mask).
	].
	^buffer