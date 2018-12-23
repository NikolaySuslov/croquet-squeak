menu
toggleFrameRate
	self fpsMorph: (self fpsMorph ifNil:[FrameRateMorph new] ifNotNil:[nil])