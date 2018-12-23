elevation
elevateConnect: vtxList1 with: vtxList2 into: aStream
	1 to: vtxList1 size-1 do:[:i|
		aStream nextPut: (T3DSimpleFace
			with: (vtxList1 at: i)
			with: (vtxList1 at: i+1)
			with: (vtxList2 at: i+1)
			with: (vtxList2 at: i))].
