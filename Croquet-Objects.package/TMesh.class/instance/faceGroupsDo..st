accessing
faceGroupsDo: aBlock
	1 to: faceGroups size by: 2 do:[ :i | aBlock value: (faceGroups at: i+1)].