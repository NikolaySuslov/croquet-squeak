special ops
add: aColor4 at: index
	| baseIdx |
	baseIdx := index-1*4.
	self floatAt: baseIdx+1 put: (self floatAt: baseIdx+1) + aColor4 red.
	self floatAt: baseIdx+2 put: (self floatAt: baseIdx+2) + aColor4 green.
	self floatAt: baseIdx+3 put: (self floatAt: baseIdx+3) + aColor4 blue.
	self floatAt: baseIdx+4 put: (self floatAt: baseIdx+4) + aColor4 alpha.
