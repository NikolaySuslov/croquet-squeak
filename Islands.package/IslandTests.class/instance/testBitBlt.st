tests-simple
testBitBlt
	| island thisForm thatForm |
	thisForm := Form extent: 100@100 depth: 8.
	island := Island new.
	thatForm := island new: Form.
	thatForm setExtent: 100@100 depth: 8.
	self shouldnt:[thisForm displayOn: thatForm] raise: Error.
	self shouldnt:[thatForm displayOn: thisForm] raise: Error.
	self shouldnt:[thisForm getCanvas drawImage: thatForm at: 0@0] raise: Error.
	self shouldnt:[thatForm getCanvas drawImage: thisForm at: 0@0] raise: Error.